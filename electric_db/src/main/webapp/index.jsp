<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electricity Bill System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('images/light.jpg') no-repeat center center/cover;
            color: white;
            text-align: center;
            padding: 100px 20px;
        }
        .features {
            padding: 50px 20px;
            text-align: center;
        }
         .cta {
            background-color: #D49137;
            color: white;
            padding: 50px 20px;
            text-align: center;
        }
        .cta a {
            color: #F07857;
            text-decoration: none;
            font-weight: bold;
        }
        .cta a:hover {
            text-decoration: underline;
        }
        .contact {
            padding: 50px 20px;
            background-color: #D49137;
        }
        .contact h2 {
            text-align: center;
            margin-bottom: 30px;
            color:white;
        }
        .mb-3 {
        color:white;
        }
       .btn{
       background-color:brown;
       }
      

/* Hover effect for navigation links */
.nav-link:hover {
    color: #D49137; 
    background-color: #CAE7D3; 
    
}
       
    </style>
</head>
<body>
    <!-- Header -->
    <header class="bg-dark text-white p-3">
        <div class="container d-flex justify-content-between align-items-center">
            <h1>Electricity Bill System</h1>
            <nav>
             <a href="#home" class="nav-link text-white me-3 text-decoration-none">Home</a>
            <a href="#features" class="nav-link text-white me-3 text-decoration-none">Features</a>
            <a href="#contact" class="nav-link text-white text-decoration-none">Contact</a>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section id="home" class="hero">
        <div class="container">
            <h1>Welcome to Electricity Bill System</h1>
            <p>Your one-stop solution for managing electricity bills effortlessly.</p>
            <a href="addBill.jsp" class="btn btn-primary btn-lg mt-4">Add Your First Bill</a>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="features bg-light">
        <div class="container">
            <h2>Why Choose Us?</h2>
            <div class="row mt-4">
                <div class="col-md-4">
                    <h3>Easy Management</h3>
                    <p>Keep track of your electricity bills with a simple and intuitive interface.</p>
                </div>
                <div class="col-md-4">
                    <h3>Secure Payments</h3>
                    <p>Pay your bills safely with our secure and reliable payment gateway.</p>
                </div>
                <div class="col-md-4">
                    <h3>24/7 Support</h3>
                    <p>Our team is available around the clock to assist you with any queries.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Call-to-Action Section -->
    <section class="cta">
        <div class="container">
            <h2>Ready to Simplify Your Bill Management?</h2>
            <p>Join us today and take the first step towards hassle-free electricity bill management!</p>
            <a href="addBill.jsp" class="btn btn-light btn-lg">Add Your First Bill</a>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact">
        <div class="container">
            <h2>Contact Us</h2>
            <form action="contactServlet" method="post" class="mt-4">
                <div class="mb-3">
                    <label for="name" class="form-label">Your Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Your Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Message</label>
                    <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Message</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3">
        <a href="#home" class="text-white text-decoration-none">Back to Top</a>
    </footer>
</body>
</html>
