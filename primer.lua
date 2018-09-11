local csv_tools = require("csv_tools")

table = csv_tools.read_csv_file("collectorlog.csv")

for index, row in ipairs(table) do
    io.write("---", index, "---\n")
    io.write("v_1 - ",tostring(row.v_1), "\n")
    io.write("v_2 - ",tostring(row.v_2), "\n")
    io.write("v_3 - ",tostring(row.v_3), "\n")
    io.write("v_4 - ",tostring(row.v_4), "\n")
    io.write("v_5 - ",row.v_5, "\n")
end