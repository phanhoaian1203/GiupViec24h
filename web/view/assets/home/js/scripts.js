document.addEventListener('DOMContentLoaded', function() {
    // Header functionality from header.js
    const hamburger = document.getElementById('hamburger');
    const navLinks = document.getElementById('navLinks');
    const header = document.getElementById('header');
    const servicesDropdown = document.getElementById('servicesDropdown');

    // Toggle mobile menu
    hamburger.addEventListener('click', function() {
        navLinks.classList.toggle('active');
        hamburger.classList.toggle('active');
    });

    // Handle dropdown on mobile
    if (window.innerWidth <= 768) {
        const dropbtn = servicesDropdown.querySelector('.dropbtn');
        dropbtn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            servicesDropdown.classList.toggle('active');
        });
    } else {
        // Handle dropdown on desktop
        servicesDropdown.addEventListener('mouseenter', function() {
            this.querySelector('.dropdown-content').style.display = 'block';
            setTimeout(() => {
                this.querySelector('.dropdown-content').style.opacity = '1';
                this.querySelector('.dropdown-content').style.transform = 'translateY(0)';
            }, 10);
        });

        servicesDropdown.addEventListener('mouseleave', function() {
            const dropdownContent = this.querySelector('.dropdown-content');
            dropdownContent.style.opacity = '0';
            dropdownContent.style.transform = 'translateY(-10px)';
            setTimeout(() => {
                dropdownContent.style.display = 'none';
            }, 200);
        });
    }

    // Close mobile menu when clicking on links
    navLinks.addEventListener('click', function(e) {
        if (e.target.tagName === 'A' && !e.target.classList.contains('dropbtn')) {
            navLinks.classList.remove('active');
            hamburger.classList.remove('active');
        }
    });

    // Close mobile menu when clicking outside
    document.addEventListener('click', function(e) {
        if (!hamburger.contains(e.target) && !navLinks.contains(e.target)) {
            navLinks.classList.remove('active');
            hamburger.classList.remove('active');
        }
    });

    // Handle window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth > 768) {
            navLinks.classList.remove('active');
            hamburger.classList.remove('active');
            servicesDropdown.classList.remove('active');
        }
    });

    // Original cscripts.js functionality
    // Smooth scroll for anchor links
    document.querySelectorAll('.nav-links a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
            // Close mobile menu if open
            navLinks.classList.remove('active');
            hamburger.classList.remove('active');
        });
    });

    // Header scroll effect (merged to avoid redundancy)
    window.addEventListener('scroll', function() {
        header.classList.toggle('scrolled', window.scrollY > 50);
    });

    // Utilities Slider
    class UtilitiesSlider {
        constructor() {
            this.wrapper = document.getElementById('utilitiesWrapper');
            this.prevBtn = document.getElementById('prevBtn');
            this.nextBtn = document.getElementById('nextBtn');
            this.indicatorsContainer = document.getElementById('indicators');
            
            this.currentSlide = 0;
            this.totalSlides = this.wrapper.children[0].children.length;
            this.cardsPerView = 4;
            this.isTransitioning = false;
            
            this.init();
        }

        init() {
            this.createIndicators();
            this.updateUI();
            this.bindEvents();
            this.startAutoSlide();
        }

        createIndicators() {
            const totalIndicators = Math.ceil(this.totalSlides / this.cardsPerView);
            for (let i = 0; i < totalIndicators; i++) {
                const indicator = document.createElement('div');
                indicator.className = 'indicator';
                indicator.addEventListener('click', () => this.goToSlide(i));
                this.indicatorsContainer.appendChild(indicator);
            }
        }

        updateUI() {
            const translateX = -this.currentSlide * (100 / this.cardsPerView);
            this.wrapper.style.transform = `translateX(${translateX}%)`;
            
            const indicators = this.indicatorsContainer.children;
            for (let i = 0; i < indicators.length; i++) {
                indicators[i].classList.toggle('active', i === this.currentSlide);
            }
        }

        goToSlide(slideIndex) {
            if (this.isTransitioning) return;
            
            this.isTransitioning = true;
            this.currentSlide = slideIndex;
            this.updateUI();
            
            setTimeout(() => {
                this.isTransitioning = false;
            }, 600);
        }

        nextSlide() {
            if (this.isTransitioning) return;
            
            const maxSlides = Math.ceil(this.totalSlides / this.cardsPerView) - 1;
            this.currentSlide = (this.currentSlide + 1) > maxSlides ? 0 : this.currentSlide + 1;
            this.goToSlide(this.currentSlide);
        }

        prevSlide() {
            if (this.isTransitioning) return;
            
            const maxSlides = Math.ceil(this.totalSlides / this.cardsPerView) - 1;
            this.currentSlide = (this.currentSlide - 1) < 0 ? maxSlides : this.currentSlide - 1;
            this.goToSlide(this.currentSlide);
        }

        bindEvents() {
            this.nextBtn.addEventListener('click', () => this.nextSlide());
            this.prevBtn.addEventListener('click', () => this.prevSlide());
            
            document.addEventListener('keydown', (e) => {
                if (e.key === 'ArrowLeft') this.prevSlide();
                if (e.key === 'ArrowRight') this.nextSlide();
            });

            let startX = 0;
            let endX = 0;
            this.wrapper.addEventListener('touchstart', (e) => {
                startX = e.touches[0].clientX;
            });

            this.wrapper.addEventListener('touchmove', (e) => {
                e.preventDefault();
            });

            this.wrapper.addEventListener('touchend', (e) => {
                endX = e.changedTouches[0].clientX;
                const diff = startX - endX;
                if (Math.abs(diff) > 50) {
                    if (diff > 0) this.nextSlide();
                    else this.prevSlide();
                }
            });

            const sliderContainer = document.querySelector('.utilities-slider');
            sliderContainer.addEventListener('mouseenter', () => this.pauseAutoSlide());
            sliderContainer.addEventListener('mouseleave', () => this.startAutoSlide());
        }

        startAutoSlide() {
            this.stopAutoSlide();
            this.autoSlideInterval = setInterval(() => {
                this.nextSlide();
            }, 5000);
        }

        pauseAutoSlide() {
            this.stopAutoSlide();
        }

        stopAutoSlide() {
            if (this.autoSlideInterval) {
                clearInterval(this.autoSlideInterval);
                this.autoSlideInterval = null;
            }
        }
    }

    // Intersection Observer for scroll animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                entry.target.style.animationPlayState = 'running';
            }
        });
    }, observerOptions);

    // Initialize Utilities Slider and observe elements
    new UtilitiesSlider();
    document.querySelectorAll('.fade-in-up, .animate__animated').forEach(el => {
        el.style.animationPlayState = 'paused';
        observer.observe(el);
    });

    // Add interactive hover and touch effects for commitment items
    document.querySelectorAll('.commitment-item').forEach(item => {
        item.addEventListener('mouseenter', function() {
            this.style.zIndex = '10';
        });
        item.addEventListener('mouseleave', function() {
            this.style.zIndex = '1';
        });
        item.addEventListener('touchstart', function() {
            this.style.zIndex = '10';
        });
        item.addEventListener('touchend', function() {
            this.style.zIndex = '1';
        });
    });
});