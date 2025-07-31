<?php
session_start();
require_once '../includes/db.php';
require_once '../includes/functions.php';

// Check if user is logged in
if (!isLoggedIn()) {
    redirect('../admin/index.php');
}

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['action'])) {
        switch ($_POST['action']) {
            case 'add':
                $title = clean($_POST['title']);
                $subtitle = clean($_POST['subtitle']);
                $display_order = (int)$_POST['display_order'];
                
                // Handle file upload
                if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
                    $upload_dir = '../uploads/featured/';
                    if (!file_exists($upload_dir)) {
                        mkdir($upload_dir, 0777, true);
                    }
                    
                    $file_extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
                    $file_name = 'slide_' . time() . '.' . $file_extension;
                    $file_path = $upload_dir . $file_name;
                    
                    if (move_uploaded_file($_FILES['image']['tmp_name'], $file_path)) {
                        $image_path = 'uploads/featured/' . $file_name;
                        
                        $query = "INSERT INTO featured_slider (title, subtitle, image_path, display_order) VALUES ('$title', '$subtitle', '$image_path', $display_order)";
                        if (runQuery($query)) {
                            showAlert('Slider item added successfully!');
                        } else {
                            showAlert('Error adding slider item.', 'error');
                        }
                    } else {
                        showAlert('Error uploading image.', 'error');
                    }
                } else {
                    showAlert('Please select an image.', 'error');
                }
                break;
                
            case 'edit':
                $id = (int)$_POST['id'];
                $title = clean($_POST['title']);
                $subtitle = clean($_POST['subtitle']);
                $display_order = (int)$_POST['display_order'];
                $is_active = isset($_POST['is_active']) ? 1 : 0;
                
                // Handle file upload if new image is provided
                if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
                    $upload_dir = '../uploads/featured/';
                    if (!file_exists($upload_dir)) {
                        mkdir($upload_dir, 0777, true);
                    }
                    
                    $file_extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
                    $file_name = 'slide_' . time() . '.' . $file_extension;
                    $file_path = $upload_dir . $file_name;
                    
                    if (move_uploaded_file($_FILES['image']['tmp_name'], $file_path)) {
                        $image_path = 'uploads/featured/' . $file_name;
                        $query = "UPDATE featured_slider SET title='$title', subtitle='$subtitle', image_path='$image_path', display_order=$display_order, is_active=$is_active WHERE id=$id";
                    } else {
                        showAlert('Error uploading image.', 'error');
                        break;
                    }
                } else {
                    $query = "UPDATE featured_slider SET title='$title', subtitle='$subtitle', display_order=$display_order, is_active=$is_active WHERE id=$id";
                }
                
                if (runQuery($query)) {
                    showAlert('Slider item updated successfully!');
                } else {
                    showAlert('Error updating slider item.', 'error');
                }
                break;
                
            case 'delete':
                $id = (int)$_POST['id'];
                $query = "DELETE FROM featured_slider WHERE id=$id";
                if (runQuery($query)) {
                    showAlert('Slider item deleted successfully!');
                } else {
                    showAlert('Error deleting slider item.', 'error');
                }
                break;
        }
        redirect('slider.php');
    }
}

// Get all slider items
$sliderItems = [];
$query = "SELECT * FROM featured_slider ORDER BY display_order ASC";
$result = runQuery($query);
if ($result) {
    while ($row = fetchRow($result)) {
        $sliderItems[] = $row;
    }
}

// Get item for editing
$editItem = null;
if (isset($_GET['edit'])) {
    $editId = (int)$_GET['edit'];
    $editItem = getSliderItem($editId);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Featured Slider - Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Montserrat', sans-serif; background: #f5f5f5; }
        
        .header { background: #F44B12; color: white; padding: 1rem 2rem; display: flex; justify-content: space-between; align-items: center; }
        .header h1 { font-size: 1.5rem; }
        .header a { color: white; text-decoration: none; padding: 0.5rem 1rem; background: rgba(255,255,255,0.2); border-radius: 5px; }
        
        .container { max-width: 1200px; margin: 2rem auto; padding: 0 1rem; }
        .card { background: white; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); margin-bottom: 2rem; }
        .card-header { background: #F44B12; color: white; padding: 1rem 1.5rem; border-radius: 10px 10px 0 0; font-weight: 600; }
        .card-body { padding: 1.5rem; }
        
        .form-group { margin-bottom: 1rem; }
        .form-group label { display: block; margin-bottom: 0.5rem; font-weight: 600; color: #333; }
        .form-group input, .form-group textarea { width: 100%; padding: 0.75rem; border: 1px solid #ddd; border-radius: 5px; font-family: inherit; }
        .form-group input:focus, .form-group textarea:focus { outline: none; border-color: #F44B12; }
        
        .btn { padding: 0.75rem 1.5rem; border: none; border-radius: 5px; cursor: pointer; font-family: inherit; font-weight: 600; text-decoration: none; display: inline-block; }
        .btn-primary { background: #F44B12; color: white; }
        .btn-secondary { background: #6c757d; color: white; }
        .btn-danger { background: #dc3545; color: white; }
        .btn-sm { padding: 0.5rem 1rem; font-size: 0.875rem; }
        
        .table { width: 100%; border-collapse: collapse; }
        .table th, .table td { padding: 0.75rem; text-align: left; border-bottom: 1px solid #ddd; }
        .table th { background: #f8f9fa; font-weight: 600; }
        .table img { max-width: 100px; height: 60px; object-fit: cover; border-radius: 5px; }
        
        .alert { padding: 1rem; margin-bottom: 1rem; border-radius: 5px; }
        .alert-success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .alert-error { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        
        .status-active { color: #28a745; font-weight: 600; }
        .status-inactive { color: #dc3545; font-weight: 600; }
        
        @media (max-width: 768px) {
            .container { padding: 0 0.5rem; }
            .table { font-size: 0.875rem; }
            .table img { max-width: 60px; height: 40px; }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>🎬 Featured Slider Management</h1>
        <div>
            <a href="dashboard.php">← Back to Dashboard</a>
            <a href="logout.php">Logout</a>
        </div>
    </div>

    <div class="container">
        <?php displayAlert(); ?>

        <!-- Add/Edit Form -->
        <div class="card">
            <div class="card-header">
                <?php echo $editItem ? '✏️ Edit Slider Item' : '➕ Add New Slider Item'; ?>
            </div>
            <div class="card-body">
                <form method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="<?php echo $editItem ? 'edit' : 'add'; ?>">
                    <?php if ($editItem): ?>
                        <input type="hidden" name="id" value="<?php echo $editItem['id']; ?>">
                    <?php endif; ?>

                    <div class="form-group">
                        <label for="title">Title *</label>
                        <input type="text" id="title" name="title" required value="<?php echo $editItem ? htmlspecialchars($editItem['title']) : ''; ?>">
                    </div>

                    <div class="form-group">
                        <label for="subtitle">Subtitle *</label>
                        <input type="text" id="subtitle" name="subtitle" required value="<?php echo $editItem ? htmlspecialchars($editItem['subtitle']) : ''; ?>">
                    </div>

                    <div class="form-group">
                        <label for="image">Image <?php echo $editItem ? '(Leave empty to keep current image)' : '*'; ?></label>
                        <input type="file" id="image" name="image" accept="image/*" <?php echo $editItem ? '' : 'required'; ?>>
                        <?php if ($editItem && $editItem['image_path']): ?>
                            <div style="margin-top: 0.5rem;">
                                <small>Current image:</small><br>
                                <img src="../<?php echo htmlspecialchars($editItem['image_path']); ?>" alt="Current" style="max-width: 200px; height: 120px; object-fit: cover; border-radius: 5px; margin-top: 0.5rem;">
                            </div>
                        <?php endif; ?>
                    </div>

                    <div class="form-group">
                        <label for="display_order">Display Order</label>
                        <input type="number" id="display_order" name="display_order" min="0" value="<?php echo $editItem ? $editItem['display_order'] : count($sliderItems) + 1; ?>">
                    </div>

                    <?php if ($editItem): ?>
                        <div class="form-group">
                            <label>
                                <input type="checkbox" name="is_active" <?php echo $editItem['is_active'] ? 'checked' : ''; ?>>
                                Active
                            </label>
                        </div>
                    <?php endif; ?>

                    <button type="submit" class="btn btn-primary">
                        <?php echo $editItem ? '💾 Update Slider Item' : '➕ Add Slider Item'; ?>
                    </button>
                    
                    <?php if ($editItem): ?>
                        <a href="slider.php" class="btn btn-secondary">Cancel</a>
                    <?php endif; ?>
                </form>
            </div>
        </div>

        <!-- Slider Items List -->
        <div class="card">
            <div class="card-header">
                📋 Current Slider Items (<?php echo count($sliderItems); ?>)
            </div>
            <div class="card-body">
                <?php if (empty($sliderItems)): ?>
                    <p>No slider items found. Add some items to get started!</p>
                <?php else: ?>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Title</th>
                                <th>Subtitle</th>
                                <th>Order</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($sliderItems as $item): ?>
                                <tr>
                                    <td>
                                        <img src="../<?php echo htmlspecialchars($item['image_path']); ?>" alt="<?php echo htmlspecialchars($item['title']); ?>">
                                    </td>
                                    <td><strong><?php echo htmlspecialchars($item['title']); ?></strong></td>
                                    <td><?php echo htmlspecialchars($item['subtitle']); ?></td>
                                    <td><?php echo $item['display_order']; ?></td>
                                    <td>
                                        <span class="<?php echo $item['is_active'] ? 'status-active' : 'status-inactive'; ?>">
                                            <?php echo $item['is_active'] ? '✅ Active' : '❌ Inactive'; ?>
                                        </span>
                                    </td>
                                    <td>
                                        <a href="slider.php?edit=<?php echo $item['id']; ?>" class="btn btn-primary btn-sm">✏️ Edit</a>
                                        <form method="POST" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this item?');">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="<?php echo $item['id']; ?>">
                                            <button type="submit" class="btn btn-danger btn-sm">🗑️ Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php endif; ?>
            </div>
        </div>
    </div>
</body>
</html>