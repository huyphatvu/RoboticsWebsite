# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Resource.create!([
#     {experiment_name: "Mapping Motors", experiment_url: "Experiment_1_Mapping_Motors.docx"},
#     {experiment_name: "Functions and Calibration", experiment_url: "Experiment_2_Functions_and_Calibration.docx"},
#     {experiment_name: "Advanced Motion", experiment_url: "Experiment_3_Advanced_Motion.docx"},
#     {experiment_name: "Variable Speed Drive", experiment_url: "Experiment_4_Variable_Speed_Drive.docx"}
#                  ])
# HabitatSuitabilityIndex.create!([{year: 2017, map_url: "b2bced03fbb047a09116ec324d8c53e0"},
#                   {year: 2016, map_url: "9b118e70af7d4a7581a3aafb0e200683"},
#                   {year: 2015, map_url: "5e8b3b199d7d478286690ff223850814"},
#                   {year: 2014, map_url: "0821a1c47a5840c39b2e9776c1407996"},
#                   {year: 2013, map_url: "702bf7539f0644a989e3fb88bd547bb8"},
#                   {year: 2012, map_url: "dec731d13a424708858a3886d45a0f29"},
#                   {year: 2011, map_url: "5661f692e0d147b486458d960a774d1f"},
#                   {year: 2010, map_url: "ebabe6160eb245acb73abe45c593f589"},
#                   {year: 2009, map_url: "02d7beb11986483ab1a21489f252e7db"},
#                   {year: 2008, map_url: "b66c72d897734650b86c143c5686ec41"},
#                   {year: 2007, map_url: "595b3f93398a4bd2a7dc5cb40955af33"},
#                   {year: 2006, map_url: "fcc2949417b14e12bf92b2eb3b655aa5"},
#                   {year: 2005, map_url: "69400583c3dd4280a25a734f166fca5c"},
#                   {year: 2004, map_url: "f7b17cc7d2c642838eba428fecc75887"},
#                   {year: 2003, map_url: "4d528e741158468a9feaca0fd3ee5555"},
#                   {year: 2002, map_url: "484bac646b694b85a53e4753a35a60f8"},
#                   {year: 2001, map_url: "0dc7cd23474c47a8a52c2595572abd21"},
#                   {year: 2000, map_url: "c097cf4d0c944bcc9a9a8c753dbce98c"},
#                   {year: 1999, map_url: "708f8a1f35f14372aaeac5f58ec2e9eb"},
#                   {year: 1998, map_url: "940071c69c8e4143a8987e1347e5a5b0"},
#                   {year: 1997, map_url: "ebe36ed2e87b40b981a8c83b1164a85a"},
#                   {year: 1996, map_url: "1ff17c419ab44888b23002a9a4c879e0"},
#                   {year: 1995, map_url: "5ce8229649344e37a563f77937b27e9f"},
#                   {year: 1994, map_url: "6154380a5e8e415086a9402cdea03d33"},
#                   {year: 1993, map_url: "72eb76ffb68a4b09bf532d79b437b9ef"},
#                   {year: 1992, map_url: "a846b0995f6b4dc0b7bd5881dffb05f5"},
#                   {year: 1991, map_url: "2b545c00457a4fbdb05a17c01570d491"},
#                   {year: 1990, map_url: "06f052d5428a4ebe987509f0aaaf2d4f"},
#                   {year: 1989, map_url: "97085cd0da054f839ba97690a3004879"},
#                   {year: 1988, map_url: "20603448425e4b4abf2cd89a64260318"},
#                   {year: 1987, map_url: "c3014d2960d14b0bac23347e30def85d"},
#                   {year: 1986, map_url: "08d85d5964f54ecf89d8d3266e83a2ba"},
#                   {year: 1985, map_url: "182b797dddf540de83cdd8b4e0f44ba5"},
#                   {year: 1984, map_url: "f8a03caf56784665b2ac268bd69bc6ac"},
#                   {year: 1983, map_url: "7f454f3ad5d74a4fb88ed88df833c45b"},
#                   {year: 1982, map_url: "f5f62baea32f40988d93005cba515c1e"},
#                   {year: 1981, map_url: "e89b91f989af4c81a9fb569faa401df9"},
#                   {year: 1980, map_url: "a23155180c8341e2ac627772b914d80a"},
#                   {year: 1979, map_url: "d0f2cc9414c94d7fb255213827244ab0"},
#                   {year: 1978, map_url: "3ae9e8f8b9bc458b9195c26e9e85efae"},
#                   {year: 1977, map_url: "7e914d6a5bbe489ab6ee16bdbf4f6f9f"},
#                   {year: 1976, map_url: "de6b211ec27d43bdb503c51839a7a52b"},
#                   {year: 1975, map_url: "8988e94ff0014856a1164e9b19df9e61"},
#                   {year: 1974, map_url: "3293a244aaac48c7a1e4221e732549a3"},
#                   {year: 1973, map_url: "8647648124864f2d9206f1e3744f3c82"},
#                   {year: 1972, map_url: "2f87233bf77e40ab88d8cab304ed0726"},
#                   {year: 1971, map_url: "eaa4cdbb2faf4cc7ace94b12d0c72b90"},
#                   {year: 1970, map_url: "c092104d34aa4dd3bdbbf42cd3a13d61"},
#                   {year: 1969, map_url: "2cb0ea9357054efc82ac99c7dfa03b47"},
#                   {year: 1968, map_url: "d281b2e61a0a4421bbf329c92f84461c"},
#                   {year: 1967, map_url: "4d6c8b6f0d4d49e5a81f1e354b680ab1"}
#                                 ])

# ************** Swan Lake Seeds
# SwanLake.create(data_date: '2008-09-05', environment_url: "SwanLake_Environment_Map9508.pdf", biology_url: "SwanLake_Biology_9508.pdf")
# SwanLake.create(data_date: '2008-05-21', environment_url: "SwanLake_Environment_Map52108.pdf", biology_url: "SwanLake_Biology_52108.pdf")
# SwanLake.create(data_date: '2009-05-18', environment_url: "SwanLake_Environment_Map51809.pdf", biology_url: "SwanLake_Biology_51809.pdf")
# SwanLake.create(data_date: '2009-07-20', environment_url: "SwanLake_Environment_Map72009.pdf", biology_url: "SwanLake_Biology_72009.pdf")
# SwanLake.create(data_date: '2009-03-16', environment_url: "SwanLake_Evironment_Map31609.pdf", biology_url: "SwanLake_Biology_31609.pdf")

# ******************** Participant
# Participant.create(first_name: "Yolanda", last_name: " Brady ", email: " bradyyj@auburn.edu", state_name: " Alabama")
# Participant.create(first_name: "Jason", last_name: " Herrmann ", email: " jason.herrmann@dcnr.ala", state_name: " Alabama")
# Participant.create(first_name: "Sean", last_name: " Powers ", email: " spowers@disl.org", state_name: " Alabama")
# Participant.create(first_name: "Bill", last_name: " Walton ", email: " wcw0003@auburn.edu", state_name: " Alabama")
# Participant.create(first_name: "Mark", last_name: " Berrigan", email: "  appliedaquaculture@gmail.com", state_name: " Florida")
# Participant.create(first_name: "Christopher", last_name: " Brooks", email: "  Christopher.Brooks@freshfromflorida.com", state_name: " Florida")
# Participant.create(first_name: "John", last_name: " Gunter", email: "  gunterjs@doacs.state.fl.us", state_name: " Florida")
# Participant.create(first_name: "Andy", last_name: " Kane ", email: " kane@ufl.edu", state_name: " Florida")
# Participant.create(first_name: "Aswani", last_name: " Volety ", email: " avolety@uncw.edu", state_name: " Florida ")
# Participant.create(first_name: "Mahdi", last_name: " Abdelguerfi ", email: " mahdi@cs.uno.edu", state_name: " Louisiana")
# Participant.create(first_name: "Pat", last_name: " Banks", email: "  pbanks@wlf.la.gov", state_name: " Louisiana")
# Participant.create(first_name: "Carl", last_name: " Britt ", email: " cbritt@wlf.la.gov", state_name: " Louisiana")
# Participant.create(first_name: "Brady", last_name: " Carter ", email: " bcarter@wlf.la.gov ", state_name: "Louisiana")
# Participant.create(first_name: "Susan", last_name: " Colley ", email: " susan.colley@uno.edu ", state_name: "Louisiana")
# Participant.create(first_name: "Paul", last_name: " Cook ", email: " pcook@wlf.la.gov", state_name: " Louisiana")
# Participant.create(first_name: "Julie", last_name: " Gauthier", email: "  gauthier@loyno.edu", state_name: " Louisiana")
# Participant.create(first_name: "Jerome", last_name: " LaPeyre ", email: " jlapeyre@agcenter.lsu.edu ", state_name: "Louisiana")
# Participant.create(first_name: "Megan", last_name: " LaPeyre ", email: " mlapeyre@agcenter.lsu.edu", state_name: " Louisiana")
# Participant.create(first_name: "Brian", last_name: " Lezina ", email: " blezina@wlf.la.gov", state_name: " Louisiana")
# Participant.create(first_name: "George", last_name: " Melancon", email: "  gmelancon@wlf.la.gov", state_name: " Louisiana")
# Participant.create(first_name: "Mark", last_name: " Schexnayder", email: "  mschexnayder@wlf.la.gov", state_name: " Louisiana")
# Participant.create(first_name: "Chris", last_name: " Schieble ", email: " cschieble@wlf.la.gov", state_name: " Louisiana")
# Participant.create(first_name: "Thomas", last_name: " Soniat ", email: " tsoniat@uno.edu", state_name: " Louisiana")
# Participant.create(first_name: "John", last_name: " Supan ", email: " jsupan@lsu.edu", state_name: " Louisiana")
# Participant.create(first_name: "Shengru", last_name: " Tu ", email: " shengru@cs.uno.edu", state_name: " Louisiana")
# Participant.create(first_name: "James", last_name: " Wray ", email: " James.Wray@la.gov ", state_name: "Louisiana")
# Participant.create(first_name: "Erik ", last_name: "Broussard", email: "  erik.broussard@dmr.ms.gov", state_name: " Mississippi")
# Participant.create(first_name: "Scott", last_name: " Gordon", email: "  scott.gordon@dmr.ms.gov", state_name: " Mississippi")
# Participant.create(first_name: "Eric ", last_name: "Powell", email: "  eric.n.powell@usm.edu", state_name: " Mississippi")
# Participant.create(first_name: "Bradley ", last_name: "Randall", email: "  bradley.randall@dmr.state.ms.us", state_name: " Mississippi ")
# Participant.create(first_name: "Brittany ", last_name: "Blomberg ", email: " brittany.blomberg@tamucc.edu", state_name: " Texas")
# Participant.create(first_name: "Jan ", last_name: "Culbertson ", email: " jan.culbertson@tpwd.state.tx.us", state_name: " Texas")
# Participant.create(first_name: "Fran", last_name: " Gelwick ", email: " fgelwick@tamu.edu", state_name: " Texas")
# Participant.create(first_name: "George", last_name: " Guillen ", email: " guillen@uhcl.edu ", state_name: "Texas")
# Participant.create(first_name: "Rick", last_name: " Kalke ", email: " rkalke@tamucc.edu", state_name: " Texas")
# Participant.create(first_name: "Jennifer", last_name: " Pollack", email: "  jennifer.pollack@tamucc.edu", state_name: " Texas")
# Participant.create(first_name: "Lance", last_name: " Robinson ", email: " lance.robinson@tpwd.state.tx.us", state_name: " Texas")
# Participant.create(first_name: "Jeri’s", last_name: " Sea Food ", email: " jerissf@aol.com", state_name: " Texas")
# Participant.create(first_name: "Greg", last_name: " Stunz ", email: " greg.stunz@tamucc.edu", state_name: " Texas")
# Participant.create(first_name: "Eileen", last_name: " Hofmann ", email: " hofmann@ccpo.odu.edu", state_name: " Virginia")
# Participant.create(first_name: "John", last_name: " Klinck ", email: " klinck@ccpo.odu.edu", state_name: " Virginia")
# Participant.create(first_name: "Roger", last_name: " Mann ", email: " rmann@vims.edu", state_name: " Virginia")