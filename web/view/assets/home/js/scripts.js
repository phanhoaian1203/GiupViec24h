// Smooth scroll for anchor links
document.querySelectorAll('.nav-links a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
        // Close mobile menu if open
        document.getElementById('navLinks').classList.remove('active');
        document.getElementById('hamburger').classList.remove('toggle');
    });
});

// Hamburger menu toggle
document.getElementById('hamburger').addEventListener('click', function() {
    document.getElementById('navLinks').classList.toggle('active');
    this.classList.toggle('toggle');
});

// Dropdown toggle for mobile
document.querySelector('.nav-links .dropdown .dropbtn').addEventListener('click', function(e) {
    if (window.innerWidth <= 768) {
        e.preventDefault();
        const dropdown = this.parentElement;
        const isActive = dropdown.classList.contains('active');
        
        // Close other dropdowns if any
        document.querySelectorAll('.nav-links .dropdown').forEach(d => {
            d.classList.remove('active');
        });

        // Toggle current dropdown
        if (!isActive) {
            dropdown.classList.add('active');
        }
    }
});

// Header scroll effect
window.addEventListener('scroll', function() {
    const header = document.getElementById('header');
    header.classList.toggle('scrolled', window.scrollY > 50);
});