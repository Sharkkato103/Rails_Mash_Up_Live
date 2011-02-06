Course.delete_all
Course.create(:id => 1,
						:title => "WebDev",
						:professor => "Mark Chang")
Course.create(:id => 2,
						:title => "MobDev")

Question.delete_all						
Question.create(:id => 1,
							:title => "OMG",
							:body => "WTF",
							:course_id => 2)
							
Response.delete_all
Response.create(:id => 1,
								:qid => 1,
								:body => "BBQ")
