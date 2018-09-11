local csv_tools = {}

function csv_tools.read_csv_file(path)
    local csv_file = io.open(path)
    local csv_table = {}
    local headers = {}
    local first_line = true

    for line in csv_file:lines() do
        if first_line then
            for header in string.gmatch(line, "[^,]+") do
                table.insert(headers, header)
            end

            first_line = false
        else
            local row = {}
            local col_index = 1

            for value_str in string.gmatch(line, "[^,]+") do
                local value = tonumber(value_str)

                if value ~= nil then
                    row[headers[col_index]] = value
                elseif(value_str:lower() == "true") then
                    row[headers[col_index]] = true
                elseif(value_str:lower() == "false") then
                    row[headers[col_index]] = false
                else
                    row[headers[col_index]] = value_str
                end

                col_index = col_index + 1
            end

            table.insert(csv_table, row)
        end
    end

    csv_file:close()

    return csv_table
end

return csv_tools