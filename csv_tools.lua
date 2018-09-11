local csv_tools = {}

function csv_tools.read_csv_file(path)

    local csv_file = io.open(path)
    local csv_table = {}
    local headers = {}
    local first_line = true

    for line in csv_file:lines() do
        if first_line then
            for col in string.gmatch(line, "[^,]+") do
                table.insert(headers, col)
            end
            first_line = false
        else
            local row = {}
            local col_index = 1
            for col in string.gmatch(line, "[^,]+") do
                row[headers[col_index]] = col
                col_index = col_index + 1
            end

            table.insert(csv_table, row)
        end
    end

    csv_file:close()

    return csv_table
end

return csv_tools