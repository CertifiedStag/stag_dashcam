# stag_dashcams

Drag and drop into your server for a more realistic way of removing dashcams from cars!

Added compatibility with ox-target and more config options.

Added the ability to destroy the camera at a set location in return for scrap.

# Add to qb-core/shared/items.lua

    ```lua
    dashcam      = { name = 'dashcam', label = 'Dashcam', weight = 1000, type = 'item', image = 'dashcam.png', unique = true, useable = false, shouldClose = true, combinable = nil, description = 'Should you have this?' },
    ```

# Dependencies

- QB-Core
- ProgressBar
