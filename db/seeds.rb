(0..5).each do |num|
  Task.create!(name: "Task #{num}", complete: false)
end
