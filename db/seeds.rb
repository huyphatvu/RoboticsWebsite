Comfy::Cms::Site.create!([
   {
       label: "homepage", identifier: "homepage", hostname: "unorobotics", path: nil, locale: "en"
   }
])

Resource.create!([
  {experiment_name: "1. Mapping Motors", experiment_url: "Experiment 1 Mapping Motors.docx"},
  {experiment_name: "2. Functions and Calibration", experiment_url: "Experiment 2 Functions and Calibration.docx"},
  {experiment_name: "3. Advanced Motion", experiment_url: "Experiment 3 Advanced Motion.docx"},
  {experiment_name: "4. Variable Speed Drive", experiment_url: "Experiment 4 Variable Speed Drive.docx"},
  {experiment_name: "5. Acceleration", experiment_url: "Experiment 5 Acceleration.docx"},
  {experiment_name: "6. Ultrasonic Sensors", experiment_url: "Experiment 6 Ultrasonic Sensors.docx"},
  {experiment_name: "8. Wall Following", experiment_url: "Experiment 8 Wall Following.docx"},
  {experiment_name: "9. CounterTimers", experiment_url: "Experiment 9 CounterTimers.docx"}
])
# Admin.create!([
#   {email: "robotics@uno.edu", encrypted_password: "$2a$11$lzSU/b/HvOFinF8dRNMpneEIvcQR86M/xYSlIG4f1wwGuaa.Yj4W.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-09-04 16:40:47", last_sign_in_at: "2018-09-04 16:40:47", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
# ])
