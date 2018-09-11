local csv_tools = require("csv_tools")

table = csv_tools.read_csv_file("collectorlog.csv")

for index, row in ipairs(table) do
    for col, value in pairs(row) do
        io.write(col, " - ",value, "\n")
    end
end