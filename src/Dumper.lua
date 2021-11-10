print("aaa")

 local appName="App Dumper"
 local path = "Apps"
 
--------------------------------------------------------------------
local function readFile(path) 
 local f = io.open(path,"r")
  local lines={}
  if(f) then
    while 1 do 
      local buf=io.read(f,512)
      if(buf ~= "")then 
        lines[#lines+1] = buf
      else
        break   
      end   
    end 
    io.close(f)
    return table.concat(lines,"") 
  end
end  
  

local function exportFiles()
  local func
  local chunk
  local file 
  local d,fn,ext
  name = "Horizon.lua"
	d,fn,ext = string.match(name, "(.-)([^/]-)%.([^/]+)$")
	if fn and ext then
	  --print (fn,ext)
	  if(string.lower(ext)=="lua") then
		print ("Exporting " .. name) 
		func = loadfile(name)
		chunk = string.dump(func,true)
		
		file = io.open("Horizon.lc","wb")
		if(file) then
		  file:write(chunk)
		  io.close(file)
		end
	  end
  end 
  print ("Exporting finished")
end
 
--------------------------------------------------------------------

local function initForm(formID)
   
  form.addSpacer(100,10)
  form.addLink((function() 
    if(form.question("Really compile apps?")==1) then
      exportFiles()
    end 
  end), {label="Compile apps and dump >>",font=FONT_BOLD})
 
  
   
end  


-------------------------------------------------------------------- 
-- Initialization
--------------------------------------------------------------------
-- Init function
local function init()  
  system.registerForm(1,MENU_APPS,appName,initForm,nil,nil)
end


  

--------------------------------------------------------------------
-- Loop function
local function loop() 
   
end
 
exportFiles()





