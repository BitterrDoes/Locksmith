-- variables
Locksmith = SMODS.current_mod
Locksmith.UIDEF = {}

-- helper funcs
function Locksmith.Load_file(file)
	local ok, func = pcall(SMODS.load_file(file, "locksmith"))
	if ok then
		print("Locksmith | Finished loading ".. file)
		return func
	end
end

function Locksmith.Load_Dir(directory) -- might change to be reccursive and go through subfolders, and subsubfolders.. etc etc
	local files = NFS.getDirectoryItems(Locksmith.path .. "/" .. directory)

	for _, filename in ipairs(files) do
		local file_path = directory .. "/" .. filename
		if file_path:match(".lua$") then
			Locksmith.Load_file(file_path)
		elseif not file_path:match(".") then -- probably ass
			Locksmith.Load_Dir(file_path)
		end
	end
end

-- body
Locksmith.Load_Dir("src")

Locksmith.crossmodds = {}
for _, file in pairs(NFS.getDirectoryItems(Locksmith.path .. "/Scripts/Compatibility")) do
	local mod = SMODS.find_mod(file)
	if next(mod) then
		Locksmith.crossmodded[mod[1].id] = mod
		Locksmith.Load_Dir("Scripts/Compatibility/".. file)
	end
end