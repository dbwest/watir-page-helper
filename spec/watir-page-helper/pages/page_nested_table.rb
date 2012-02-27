module WatirPageHelper::PageNestedTable
  extend WatirPageHelper::ClassMethods
  include TestPage

  table :test_table, :id => "mySecondTable"
  row(:test_table_row_1) { |page| page.test_table.tr }
  cell(:test_table_row_1_cell_1) { |page| page.test_table_row_1_row.td }
end