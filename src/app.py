from flask import Flask, render_template_string, jsonify

app = Flask(__name__)

# Dark theme HTML template
dark_template = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flask API - Dark Theme</title>
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #1f1f1f;
            padding: 20px;
            text-align: center;
            font-size: 1.8em;
            font-weight: bold;
            color: #00bcd4;
        }
        main {
            padding: 40px;
            text-align: center;
        }
        .card {
            background-color: #1e1e1e;
            border-radius: 8px;
            padding: 20px;
            display: inline-block;
            box-shadow: 0 4px 8px rgba(0,0,0,0.5);
        }
        .btn {
            background-color: #00bcd4;
            color: #121212;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 20px;
        }
        .btn:hover {
            background-color: #0097a7;
        }
    </style>
</head>
<body>
    <header>🚀 Flask API - Dark Theme</header>
    <main>
        <div class="card">
            <p>Welcome to your Flask API!</p>
            <p>This is a visually appealing dark theme demo.</p>
            <a href="/api/hello"><button class="btn">Try API</button></a>
        </div>
    </main>
</body>
</html>
"""

@app.route("/")
def home():
    return render_template_string(dark_template)

@app.route("/api/hello")
def hello_api():
    return jsonify({"message": "Hello from your Flask API!"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
