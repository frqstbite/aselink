local PACKAGE = "com.frqstbite.aselink"

local uuid = dofile('./uuid.lua')

--
--
--
function open()
    local data = Dialog("Open Shared Sprite")
        :entry { id="key", label="Aselink Key:", text=uuid(), focused=true, }
        :separator { text="Advanced" }
        :entry { id="host", label="Host:", text="api.frqst.site/aselink", }
        :button { id="connect", text="Open", }
        :button { id="cancel", text="Cancel", }
        :show { }.data

    if data.connect then
        print("Connecting to server...")
        --[[local user = data.user_value
        local url = "http://localhost:8080/share/" .. user
        local response = http.request(url)
        local sprite = Sprite{ fromFile = response.body }
        app.activeSprite = sprite]]
    end
end

function share()
    local sprite = app.activeSprite
end

--
--
--
function init(plugin)

    -- Register open shared command
    plugin:newCommand {
        id = PACKAGE .. ":openSharedSprite",
        title = "Open Shared Sprite...",
        group = "file_open",
        onclick = open,
    }

    -- Register share command
    plugin:newCommand {
        id = PACKAGE .. ":shareSprite",
        title = "Share",
        group = "sprite_duplicate",
        onclick = share,
        onenabled = function()
            return app.activeSprite ~= nil
        end,
    }

end

function exit()

end