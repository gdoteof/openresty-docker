--[[
Auxiliary function to split a string based on a delimiter
   ]]--
 
function string:split(delimiter)
   local result = { }
   local from = 1
   local delim_from, delim_to = string.find( self, delimiter, from )
   while delim_from do
      table.insert( result, string.sub( self, from , delim_from-1 ) )
      from = delim_to + 1
      delim_from, delim_to = string.find( self, delimiter, from )
   end
   table.insert( result, string.sub( self, from ) )
   return result
end


--- Table dumping
-- @param data a table
-- @return stringified table
function vardump(data)
  local function rvardump (rdata, erg,indent,key)

    local linePrefix = ""
    if key ~= nil then
      linePrefix = string.format("[%s]",key)
    end

    if(indent == nil) then
      indent = 0
    else
      indent = indent +1
      table.insert(erg,string.rep(" ",indent))
    end

    if type(rdata) == 'table' then
      mTable = getmetatable(rdata)
      if mTable == nil then
        table.insert(erg,linePrefix)
        table.insert(erg ,"(table)")
      else
        table.insert(erg ,"(metatable)")
        rdata = mTable
      end
      table.insert(erg,"\n")
      for tableKey, tableValue in pairs(rdata) do
        rvardump(tableValue, erg,indent,tableKey)
      end
    elseif  type(rdata) == 'function'   or
      type(rdata) == 'thread' or
      type(rdata) == 'userdata' or
      rdata   == nil  then

      table.insert(erg,tostring(rdata))
      table.insert(erg,"\n")
    else
      table.insert(erg,string.format("%s(%s)%s",linePrefix,type(rdata),tostring(rdata)))
      table.insert(erg,"\n")
    end
  end

  local erg= {}
  rvardump(data,erg)

  return table.concat(erg)
end

return vardump
