052 Update through Checkboxes
=============================

Followed along with Railscast 052 Update through Checkboxes

[Blog Post](http://patrickperey.com/railscast-052-update-through-checkboxes) @ [PatrickPerey.com](http://patrickperey.com)

```ruby
def index
  @incomplete_tasks = Task.where(complete: false)
  @complete_tasks = Task.where(complete: true)
end
```

```ruby
def complete
  Task.where(id: params[:task_ids]).update_all(["complete=?", true])
  redirect_to tasks_path, notice: 'Task completed'
end
```

```erb
<%= form_tag complete_tasks_path, method: :put do  %>
  <ul>
    <% @incomplete_tasks.each do |task| %>
    <li>
      <%= check_box_tag "task_ids[]", task.id %>
      <%= task.name %>
    </li>
    <% end %>
  </ul>
  <%= submit_tag "Complete task" %>
<% end %>
```
