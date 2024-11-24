-- FPS Boost and Lag Reduction Script
-- This script is optimized for both PC and Mobile

-- Check if the game is running on mobile
local isMobile = game:GetService("UserInputService").TouchEnabled

-- Function to optimize graphics for PC
local function optimizeForPC()
    -- Lowering graphics quality settings for better FPS
    game:GetService("GraphicsSettings").QualityLevel = Enum.QualityLevel.Level01  -- Low graphics quality

    -- Disabling ambient lighting and reflections for better performance
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 0

    -- Turn off particle effects for better performance
    game:GetService("Lighting").ParticleEmitterQuality = Enum.ParticleEmitterQuality.Low
end

-- Function to optimize for Mobile
local function optimizeForMobile()
    -- Disable ambient lighting and effects
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 0
    game:GetService("Lighting").Bloom.Enabled = false
    game:GetService("Lighting").ColorCorrection.Enabled = false
    game:GetService("Lighting").DepthOfField.Enabled = false
    game:GetService("Lighting").LensFlare.Enabled = false
    game:GetService("Lighting").MotionBlur.Enabled = false

    -- Reduce unnecessary UI elements (e.g., chat bubbles, graphics-heavy UI)
    game:GetService("UserSettings").GameSettings.MasterVolume = 0  -- Optional: Disable sound
end

-- Common Optimizations for Both Platforms
local function commonOptimizations()
    -- Optimize Camera Field of View (FOV)
    local camera = game:GetService("Workspace").CurrentCamera
    camera.FieldOfView = 70  -- Default is 90

    -- Disable character shadows to improve performance
    local player = game.Players.LocalPlayer
    if player.Character then
        for _, part in ipairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CastShadow = false
            end
        end
    end
end

-- Function to apply FPS cap for PC (Mobile is limited by Roblox)
local function applyFpsCap()
    if not isMobile then
        setfpscap(60)  -- Set to 60 FPS for PC (can increase to 120 or 144 if supported)
    end
end

-- Run optimizations based on platform
if isMobile then
    -- Apply mobile optimizations
    optimizeForMobile()
else
    -- Apply PC optimizations
    optimizeForPC()
end

-- Apply common optimizations for both platforms
commonOptimizations()

-- Apply FPS cap for PC
applyFpsCap()

-- Message indicating the optimizations are applied
print("FPS Boost Applied. Optimizations for both Mobile and PC.")