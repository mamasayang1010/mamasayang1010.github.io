<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hosting Panel - ARG MAMENQIU</title>
    <link rel="stylesheet" href="/styles/styles.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        header {
            text-align: center;
            background-color: #333;
            color: white;
            padding: 1rem;
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #444;
        }

        nav a {
            color: white;
            padding: 0.5rem 1rem;
            text-decoration: none;
        }

        nav a:hover {
            background-color: #555;
        }

        main {
            padding: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #333;
            color: white;
        }

        footer {
            text-align: center;
            padding: 1rem;
            background-color: #333;
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        .game-canvas {
            width: 100%;
            height: 100vw;
            max-width: 500px;
            max-height: 500px;
            margin: auto;
        }

        .keys {
            font-family: 'Lato', sans-serif;
            text-align: center;
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            height: 200px;
            margin: auto;
        }

        .chevron {
            display: inline-block;
        }

        .chevron::before {
            border-style: solid;
            border-width: 8px 8px 0 0;
            content: '';
            display: inline-block;
            height: 20px;
            width: 20px;
            position: relative;
            transform: rotate(-45deg);
        }

        .chevron.down::before {
            transform: rotate(135deg);
        }

        .chevron.right::before {
            transform: rotate(45deg);
        }

        .chevron.left::before {
            transform: rotate(225deg);
        }

        .arr {
            cursor: pointer;
            width: 70px;
            height: 70px;
            text-align: center;
            line-height: 100px;
            background: gray;
            color: white;
            font-size: 50px;
            border: 10px solid #ddd;
            display: inline-block;
            margin: 5px;
            transition: background-color 0.05s linear;
        }

        .arr:active {
            background: #555;
        }

        #game-container {
            display: flex;
            flex-direction: column;
            background-color: rgba(220, 220, 220, 0.6);
            margin: 1rem;
            padding: 1rem;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Hosting Panel - ARG MAMENQIU</h1>
        <p>Kelola situs Anda dengan mudah dan aman.</p>
    </header>
    <nav>
        <a href="#dashboard">Dasbor</a>
        <a href="#monitoring">Monitoring Server</a>
        <a href="#account">Akun Hosting</a>
    </nav>
    <main id="dashboard">
        <section>
            <h2>Selamat Datang di Hosting Panel</h2>
            <form action="/add" method="POST">
                <input type="text" name="domain" placeholder="Masukkan Domain" required>
                <button type="submit">Tambah Domain</button>
            </form>
        </section>
        <div class="dashboard-section">
            <h2>Domain Terdaftar</h2>
            <table>
                <thead>
                    <tr>
                        <th>Domain</th>
                        <th>CPU Usage (%)</th>
                        <th>Memory Usage (%)</th>
                        <th>Disk Usage (%)</th>
                    </tr>
                </thead>
                <tbody>
                    <% data.forEach(function(item) { %>
                    <tr>
                        <td><%= item.domain %></td>
                        <td><%= item.cpuUsage.toFixed(2) %></td>
                        <td><%= item.memoryUsage.toFixed(2) %></td>
                        <td><%= item.diskUsage.toFixed(2) %></td>
                    </tr>
                    <% }); %>
                </tbody>
            </table>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 ARG MAMENQIU - Hosting Panel</p>
    </footer>
    <script src="/scripts/scripts.js"></script>
</body>
</html>
