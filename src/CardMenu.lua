-- hook rightclick
    -- check hovered card?
        -- open menu for jokers and deck
        -- mayb later menu for consumables so you can set times used

local oldHover = Node.hover
function Node.hover(self)
    oldHover(self)
    Locksmith.latestHover = self
end

local oldstop_Hover = Node.stop_hover
function Node.stop_hover(self)
    oldstop_Hover(self)
    if Locksmith.latestHover == self then
        Locksmith.latestHover = nil
    end
end

