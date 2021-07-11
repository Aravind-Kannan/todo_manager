class Todo < ActiveRecord::Base
  belongs_to :user

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  end

  def of_user(user)
    where(user_id: user.id)
  end

  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end

  def self.add_task(taskDetails)
    Todo.create!(
      todo_text: taskDetails[:todo_text],
      due_date: Date.today + taskDetails[:due_in_days],
      completed: false,
    )
  end

  def self.mark_as_complete(todo_id)
    todo = find_by(id: todo_id)
    todo.completed = true
    todo.save
    find_by(id: todo_id)
  end
end
