require 'minitest/autorun'
require_relative "../lib/family"

describe Family do
  it "prints every member of the family" do
    family = Family.new "Jackson"

    family.add_father "John"
    family.add_mother "Jane"

    3.times { |i| family.add_child "Child #{i}", "F"}

    output = capture_io { family.each_member { |member| puts family.full_name(member) }}.to_s

    output = output.split("\\n")
    output.pop
    output[0] = output[0][2...14]
    output = output.join(" ")
    # require 'pry'; binding.pry


    output.must_equal <<EOF
John Jackson
Jane Jackson
Child 0 Jackson
Child 1 Jackson
Child 2 Jackson
EOF
  end
end