
function load_alignment(alignment, max_evalue, min_bit_score)
   local PARSER = assert(io.open(alignment))
   local init = ""
   for buff in PARSER:lines() do
      if buff:sub(1,1) ~= "#" then
         local query, e_value, bit_score = string.match(buff, "^(%S+).*\t(%S+)\t(%S+)$")
      --   print (query, e_value, bit_score)
         if init ~= query then
           init =  query
           if tonumber(e_value) < tonumber(max_evalue) and tonumber(bit_score) > tonumber(min_bit_score) then
              print (buff)
            end 
         end
      end
   end
   PARSER:close()
end


-- main
if arg[1] == nil then
   print ("Usage: luajit " .. arg[0] .. " alignment evalue bit_score")
   os.exit(1)
end

load_alignment(arg[1], arg[2], arg[3])
