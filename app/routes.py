from flask import render_template, request, redirect, url_for
from .app import db
from .models import Task
from flask import current_app as app

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        title = request.form.get("title")
        if title:
            new_task = Task(title=title)
            db.session.add(new_task)
            db.session.commit()
        return redirect(url_for("index"))
    
    tasks = Task.query.all()
    return render_template("index.html", tasks=tasks)

@app.route("/complete/<int:task_id>")
def complete(task_id):
    task = Task.query.get(task_id)
    task.done = not task.done
    db.session.commit()
    return redirect(url_for("index"))

@app.route("/delete/<int:task_id>")
def delete(task_id):
    task = Task.query.get(task_id)
    db.session.delete(task)
    db.session.commit()
    return redirect(url_for("index"))
