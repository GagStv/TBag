-- seterrorhandler(function(err)
--     print("TBag ERROR:", err, debugstack())
-- end)

-- BANK Start

TBag.ENABLE_BANK = false

function IsReagentBankUnlocked()
    return false
end

function CloseBankFrame()
    return
end

-- BANK End

-- Minimal compatibility layer for WoW 12

-- Bank container compatibility
if not BANK_CONTAINER then
    BANK_CONTAINER = tonumber(Enum.BagIndex.Bank)
end

if not REAGENTBANK_CONTAINER then
    REAGENTBANK_CONTAINER = tonumber(Enum.BagIndex.ReagentBank)
end

-- Safety
BANK_CONTAINER = BANK_CONTAINER or -1
REAGENTBANK_CONTAINER = REAGENTBANK_CONTAINER or -3

-- Bag slot compatibility
if not NUM_BAG_SLOTS then
    NUM_BAG_SLOTS = NUM_TOTAL_EQUIPPED_BAG_SLOTS or 4
end

if not BACKPACK_CONTAINER then
    BACKPACK_CONTAINER = 0
end

if not NUM_BANKBAGSLOTS then
    NUM_BANKBAGSLOTS = 0
end

if not C_Container then return end

-- Number of slots
function GetContainerNumSlots(bag)
    return C_Container.GetContainerNumSlots(bag) or 0
end

-- Item
function GetContainerItemInfo(bag, slot)
    return C_Container.GetContainerItemInfo(bag, slot)
end

function GetContainerItemLink(bag, slot)
    return C_Container.GetContainerItemLink(bag, slot)
end

function PickupContainerItem(bag, slot)
    C_Container.PickupContainerItem(bag, slot)
end

-- Bank slots
function GetNumBankSlots()
    local slots = C_Container.GetContainerNumSlots(BANK_CONTAINER)
    return slots or 0, false
end

-- Cooldowns
function GetContainerItemCooldown(bag, slot)
    return C_Container.GetContainerItemCooldown(bag, slot)
end

-- Quest info
function GetContainerItemQuestInfo(bag, slot)
    return C_Container.GetContainerItemQuestInfo(bag, slot)
end

-- =========================
-- Currency API compatibility
-- =========================

function GetCurrencyListSize()
    return C_CurrencyInfo.GetCurrencyListSize()
end

function GetCurrencyListInfo(index)
    return C_CurrencyInfo.GetCurrencyListInfo(index)
end
