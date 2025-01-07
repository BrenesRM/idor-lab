from flask import Flask, request, render_template, abort
import mysql.connector

app = Flask(__name__)

# Database connection
def get_db_connection():
    return mysql.connector.connect(
        host="db",
        user="user",
        password="userpassword",
        database="idor_lab"
    )

# Simulate a logged-in user
LOGGED_IN_USER_ID = 1

@app.route('/profile')
def profile():
    user_id = request.args.get('id')
    if int(user_id) != LOGGED_IN_USER_ID:  # Authorization check
        abort(403)  # Forbidden
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users WHERE id = %s", (user_id,))
    user = cursor.fetchone()
    conn.close()
    if user:
        return render_template('profile.html', user=user)
    return "User not found", 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
