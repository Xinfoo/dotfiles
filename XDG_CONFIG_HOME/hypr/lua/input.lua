--------------
---- 输入 ----
--------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 ~ 1.0，0 表示不做修改。

        touchpad = {
            natural_scroll = true,
            scroll_factor  = 1.0,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- 按设备配置
-- scroll_factor 小于 1 会缩短滚动距离，大于 1 会放大滚动距离。
-- 更多信息参见 https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/

-- ThinkPad 触控板
hl.device({
    name = "elan0676:00-04f3:3195-touchpad",
    scroll_factor = 0.5,
})

-- ThinkPad 小红点
hl.device({
    name = "tpps/2-elan-trackpoint",
    scroll_factor = 1.0,
})

-- 前行者X23PRO鼠无线模式
hl.device({
    name = "0-x23-pro-receiver",
    accel_profile = "flat",
})

-- 前行者X23PRO鼠有线模式
hl.device({
    name = "eweadn-x23-pro",
    accel_profile = "flat",
})
