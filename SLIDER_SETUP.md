# 🎬 Featured Slider Setup Guide

## 📋 **Database Migration**

### Option 1: Fresh Database
If you're setting up a new database, use:
```sql
-- Import the complete database
source database/production_db.sql
```

### Option 2: Existing Database
If you already have a database, just add the slider table:
```sql
-- Run this migration
source database/add_slider_table.sql
```

## 🚀 **Features Implemented**

### ✅ **Frontend Integration**
- **Homepage Slider**: Database-driven 3D coverflow slider
- **Dynamic Content**: Pulls title, subtitle, and images from database
- **Fallback System**: Uses demo data if database is empty
- **Smooth Animations**: JavaScript handles transitions

### ✅ **Admin Panel**
- **Navigation**: Added "Featured Slider" link in admin sidebar
- **Dashboard Stats**: Shows slider count with management link
- **Full CRUD**: Add, Edit, Delete, Toggle status operations
- **Image Upload**: Direct file upload with automatic path handling
- **Display Order**: Drag-and-drop style ordering system

### ✅ **Database Structure**
```sql
CREATE TABLE `featured_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## 🔧 **Admin Access**

### **URLs:**
- **Admin Login**: `/admin/`
- **Slider Management**: `/admin/slider.php`
- **Dashboard**: `/admin/dashboard.php`

### **Functions Added:**
- `getFeaturedSlider()` - Get all active slider items
- `getSliderItem($id)` - Get specific slider item by ID

## 📁 **File Structure**
```
front/
├── admin/
│   └── slider.php          # Slider management page
├── database/
│   ├── production_db.sql   # Complete database with slider
│   └── add_slider_table.sql # Migration for existing DB
├── includes/
│   └── functions.php       # Added slider functions
├── uploads/
│   └── featured/           # Slider images directory
└── index.php               # Updated with database integration
```

## 🎯 **How It Works**

### **Admin Workflow:**
1. Login to admin panel
2. Navigate to "Featured Slider"
3. Add/Edit slider items with:
   - Title (e.g., "Bold Brand Reveal")
   - Subtitle (e.g., "Launch Teaser • Motion + Sound Design")
   - Image upload
   - Display order
   - Active/Inactive status

### **Frontend Display:**
1. Homepage loads slider from database
2. Shows active items in display order
3. 5-card coverflow with smooth transitions
4. Auto-updates when admin changes content

## 🛠️ **Technical Details**

### **PHP Functions:**
```php
// Get all active slider items
$slides = getFeaturedSlider();

// Get specific slider item
$item = getSliderItem($id);
```

### **JavaScript Integration:**
```javascript
// Dynamic data from PHP
const SLIDES_DATA = [
  <?php
    foreach ($slides as $slide) {
      echo "{img:'{$slide['image_path']}', title:'{$slide['title']}', sub:'{$slide['subtitle']}'},";
    }
  ?>
];
```

## 🎨 **Customization**

### **Adding More Slides:**
- No code changes needed
- Just add through admin panel
- Slider automatically adapts

### **Styling Changes:**
- CSS in `index.php` (lines 155-240)
- JavaScript animations (lines 363-456)

## 🚀 **Go Live Steps**

1. **Import Database:**
   ```sql
   -- For new setup
   source database/production_db.sql
   
   -- For existing database
   source database/add_slider_table.sql
   ```

2. **Create Upload Directory:**
   ```bash
   mkdir -p uploads/featured
   chmod 755 uploads/featured
   ```

3. **Test Admin Access:**
   - Login to `/admin/`
   - Navigate to "Featured Slider"
   - Add test slider item

4. **Verify Frontend:**
   - Visit homepage
   - Check slider displays database content
   - Test slider navigation

## 🎉 **Ready to Use!**

Your slider is now fully database-driven and admin-manageable!

**Admin can now:**
- ✅ Add new slider items
- ✅ Upload custom images  
- ✅ Edit titles and subtitles
- ✅ Set display order
- ✅ Toggle active/inactive status
- ✅ Delete unwanted items

**Frontend automatically:**
- ✅ Shows database content
- ✅ Updates in real-time
- ✅ Maintains smooth animations
- ✅ Falls back to demo data if needed