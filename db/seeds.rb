Course.delete_all
Course.create(:id => 1,
						:title => "Web Development",
						:professor => "Mark Dragon")
Course.create(:id => 2,
						:title => "Mobile Development",
						:professor => "Mark Dragon")
Course.create(:id => 3,
						:title => "Error Control Codes",
						:professor => "Sarah Spence Adams")
Course.create(:id => 4,
						:title => "Computing and Craft",
						:professor => "Amon Millner")
Course.create(:id => 5,
						:title => "Software Systems",
						:professor => "Mark Sheldon")
Course.create(:id => 6,
						:title => "Partial Differential Equations",
						:professor => "Aaron Hoffman")						
Course.create(:id => 7,
						:title => "Software Design",
						:professor => "Allen Downey")						
Course.create(:id => 8,
						:title => "Engineering in Java",
						:professor => "Allen Downey")						


Question.delete_all						
Question.create(:id => 1,
							:title => "OMG",
							:body => "WTF",
							:course_id => 2)
							
Response.delete_all
Response.create(:id => 1,
								:question_id => 1,
								:body => "BBQ")
