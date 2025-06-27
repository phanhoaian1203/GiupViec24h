<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thuê Nhân Viên Dọn Dẹp - Giúp Việc 24h</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #1a1a1a;
            background: #ecece6;
            overflow-x: hidden;
        }

        .section {
            padding: 4rem 0;
            position: relative;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1.5rem;
        }

        /* Hero Section - Matching Index.jsp Style */
        .hero {
            background: linear-gradient(135deg, #ecece6 0%, #d0d0d0 50%, #ecece6 100%);
            min-height: 70vh;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
            padding-top: 80px;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: 
                radial-gradient(circle at 20% 80%, rgba(192, 169, 135, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(192, 169, 135, 0.12) 0%, transparent 50%);
            pointer-events: none;
        }

        .hero-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            position: relative;
            z-index: 2;
        }

        .hero-content {
            color: #1a1a1a;
        }

        .hero-title {
            font-size: 3.2rem;
            font-weight: 900;
            line-height: 1.15;
            margin-bottom: 1.5rem;
            color: #1a1a1a;
            letter-spacing: -0.02em;
        }

        .hero-subtitle {
            font-size: 1.25rem;
            margin-bottom: 2.5rem;
            opacity: 0.85;
            line-height: 1.6;
            font-weight: 600;
            color: #4a4a4a;
            max-width: 90%;
        }

        .hero-visual {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .hero-banner {
            width: 100%;
            max-width: 400px;
            height: auto;
            filter: drop-shadow(0 25px 50px rgba(0,0,0,0.15));
            transition: transform 0.3s ease;
        }

        .hero-banner:hover {
            transform: translateY(-5px) scale(1.02);
        }

        .floating-elements {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }

        .floating-icon {
            position: absolute;
            width: 60px;
            height: 60px;
            background: #c0a987;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-size: 1.5rem;
            box-shadow: 0 10px 30px rgba(192, 169, 135, 0.35);
            animation: float 6s ease-in-out infinite;
        }

        .floating-icon:nth-child(1) {
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-icon:nth-child(2) {
            top: 60%;
            right: 15%;
            animation-delay: 2s;
        }

        .floating-icon:nth-child(3) {
            bottom: 30%;
            left: 20%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(5deg);
            }
        }

        .hero-cta {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            align-items: center;
        }

        /* Buttons - Matching Index.jsp */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.8rem 1.5rem;
            text-decoration: none;
            font-weight: 700;
            font-size: 0.95rem;
            transition: background 0.3s ease, transform 0.2s ease;
            border: 2px solid transparent;
            cursor: pointer;
            min-width: 140px;
        }

        .btn-primary {
            background: #c0a987;
            color: #ffffff;
            border-color: #c0a987;
        }

        .btn-primary:hover {
            background: #a68e6e;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: transparent;
            color: #4a4a4a;
            border-color: #d0d0d0;
        }

        .btn-secondary:hover {
            background: #d0d0d0;
            color: #1a1a1a;
            transform: translateY(-2px);
        }

        /* Search Section */
        .search-section {
            background: #ffffff;
            padding: 3rem 0;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            position: relative;
            z-index: 10;
        }

        .search-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .search-form {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr auto;
            gap: 1.5rem;
            align-items: end;
            background: #ecece6;
            padding: 2rem;
            border: 1px solid #d0d0d0;
        }

        .form-group {
            position: relative;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
            color: #1a1a1a;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 1rem;
            border: 2px solid #d0d0d0;
            background: white;
            transition: all 0.3s ease;
            font-family: inherit;
            font-size: 0.9rem;
            color: #1a1a1a;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #c0a987;
            box-shadow: 0 0 0 3px rgba(192, 169, 135, 0.1);
        }

        .search-input {
            position: relative;
        }

        .search-input i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
            font-size: 0.9rem;
            z-index: 1;
        }

        .search-input input {
            padding-left: 2.5rem;
        }

        .btn-search {
            background: #c0a987;
            color: #ffffff;
            border: 2px solid #c0a987;
            padding: 1rem 1.5rem;
            font-weight: 700;
        }

        .btn-search:hover {
            background: #a68e6e;
            transform: translateY(-2px);
        }

        /* Main Content Layout */
        .booking-section {
            max-width: 1400px;
            margin: 0 auto;
            padding: 3rem 2rem;
            display: flex;
            gap: 2rem;
            background: #ffffff;
        }

        /* Sidebar with Scrollable Content */
        .sidebar {
            width: 320px;
            background: #ecece6;
            border: 1px solid #d0d0d0;
            position: sticky;
            top: 120px;
            height: calc(100vh - 140px);
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .sidebar-header {
            padding: 2rem;
            border-bottom: 2px solid #d0d0d0;
            background: #ecece6;
        }

        .sidebar-title {
            font-size: 1.3rem;
            color: #1a1a1a;
            margin: 0;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: -0.02em;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .sidebar-title i {
            color: #c0a987;
            font-size: 1.2rem;
        }

        .sidebar-content {
            flex: 1;
            overflow-y: auto;
            padding: 0;
            scrollbar-width: thin;
            scrollbar-color: #c0a987 #ecece6;
        }

        .sidebar-content::-webkit-scrollbar {
            width: 8px;
        }

        .sidebar-content::-webkit-scrollbar-track {
            background: #ecece6;
        }

        .sidebar-content::-webkit-scrollbar-thumb {
            background: #c0a987;
            border-radius: 4px;
        }

        .sidebar-content::-webkit-scrollbar-thumb:hover {
            background: #a68e6e;
        }

        .filter-group {
            padding: 2rem;
            border-bottom: 1px solid #d0d0d0;
        }

        .filter-group:last-child {
            border-bottom: none;
        }

        .filter-title {
            font-size: 1rem;
            font-weight: 800;
            margin-bottom: 1rem;
            color: #1a1a1a;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .filter-title::after {
            content: '';
            display: block;
            width: 50px;
            height: 1px;
            background: #c0a987;
            margin: 0.5rem 0;
        }

        /* Traditional Service List */
        .service-list {
            list-style: none;
        }

        .service-list li {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .service-list input[type="checkbox"] {
            margin-right: 1rem;
            accent-color: #c0a987;
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .service-list label {
            color: #4a4a4a;
            font-size: 0.9rem;
            font-weight: 500;
            cursor: pointer;
            transition: color 0.3s ease;
            line-height: 1.4;
        }

        .service-list label:hover {
            color: #1a1a1a;
        }

        .service-list input:checked + label {
            color: #1a1a1a;
            font-weight: 700;
        }

        /* Price Range */
        .price-range {
            margin-top: 1rem;
        }

        .price-inputs {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .price-inputs input {
            flex: 1;
            padding: 0.75rem;
            border: 2px solid #d0d0d0;
            font-size: 0.85rem;
            text-align: center;
            transition: border-color 0.3s ease;
        }

        .price-inputs input:focus {
            border-color: #c0a987;
            box-shadow: 0 0 0 3px rgba(192, 169, 135, 0.1);
        }

        .price-inputs span {
            color: #4a4a4a;
            font-weight: 600;
        }

        /* Main Content */
        .main-content {
            flex: 1;
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 3rem;
            padding-bottom: 1.5rem;
            border-bottom: 2px solid #ecece6;
        }

        .booking-title {
            color: #000000;
            font-size: 2.8rem;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: -0.02em;
        }

        .results-count {
            color: #4a4a4a;
            font-size: 1rem;
            margin-top: 0.5rem;
            font-weight: 500;
        }

        /* Filter Status Indicator */
        .filter-status {
            background: #e6fffa;
            border: 1px solid #c0a987;
            color: #1a1a1a;
            padding: 1rem;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 600;
        }

        .filter-status i {
            color: #c0a987;
        }

        .clear-filters {
            background: none;
            border: none;
            color: #c0a987;
            text-decoration: underline;
            cursor: pointer;
            font-size: 0.9rem;
            margin-left: auto;
            font-weight: 600;
        }

        .sort-options {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .sort-options label {
            font-weight: 700;
            color: #1a1a1a;
            font-size: 0.9rem;
            text-transform: uppercase;
        }

        .sort-select {
            padding: 0.75rem;
            border: 2px solid #d0d0d0;
            font-size: 0.85rem;
            background: white;
            transition: border-color 0.3s ease;
            font-weight: 600;
        }

        .sort-select:focus {
            outline: none;
            border-color: #c0a987;
        }

        /* Helper Cards - IMPROVED with flexible heights */
        .helper-list {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.2rem;
            /* Use auto-fit for better flexibility */
            align-items: start;
        }

        /* IMPROVED: Flexible card height to accommodate all skills */
        .helper-card {
            background: white;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            border: 1px solid #d0d0d0;
            display: flex;
            flex-direction: column;
            /* Remove fixed height to allow dynamic sizing */
            min-height: 450px;
            border-radius: 8px;
        }

        .helper-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            border-color: #c0a987;
        }

        /* IMPROVED: Adjust image height for better proportion with full skills display */
        .helper-image-container {
            position: relative;
            height: 200px; /* Slightly reduced to make room for skills */
            overflow: hidden;
        }

        .helper-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .helper-card:hover .helper-image {
            transform: scale(1.02);
        }

        .helper-status {
            position: absolute;
            top: 8px;
            right: 8px;
            background: #c0a987;
            color: white;
            padding: 0.3rem 0.6rem;
            font-size: 0.7rem;
            font-weight: 700;
            text-transform: uppercase;
            border-radius: 4px;
        }

        .helper-discount {
            position: absolute;
            top: 8px;
            left: 8px;
            background: #ef4444;
            color: white;
            padding: 0.3rem 0.6rem;
            font-size: 0.7rem;
            font-weight: 700;
            text-transform: uppercase;
            border-radius: 4px;
        }

        /* IMPROVED: Compact info section */
        .helper-info {
            padding: 1rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            background: #ecece6;
        }

        .helper-header {
            margin-bottom: 0.6rem;
        }

        .helper-name {
            font-size: 0.95rem; /* Slightly smaller */
            color: #1a1a1a;
            font-weight: 800;
            margin-bottom: 0.3rem;
            letter-spacing: -0.01em;
            line-height: 1.2;
        }

        .helper-location {
            font-size: 0.75rem; /* Smaller */
            color: #4a4a4a;
            display: flex;
            align-items: center;
            gap: 0.3rem;
            margin-bottom: 0.3rem;
            font-weight: 500;
        }

        .helper-location i {
            color: #c0a987;
            width: 12px;
            font-size: 0.7rem;
        }

        .helper-rating {
            display: flex;
            align-items: center;
            gap: 0.3rem;
            font-size: 0.75rem; /* Smaller */
            color: #4a4a4a;
            font-weight: 600;
        }

        .helper-rating i {
            color: #fbbf24;
            font-size: 0.8rem;
        }

        /* IMPROVED: Dynamic specialties section - Full display */
        .helper-specialties {
            margin: 0.6rem 0;
            flex-grow: 1;
            min-height: 60px; /* Ensure minimum space for skills */
        }

        .specialty-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.2rem;
            /* Remove max-height to show all skills */
            max-height: none;
            overflow: visible;
            line-height: 1.2;
        }

        .specialty-tag {
            background: #ffffff;
            color: #4a4a4a;
            padding: 0.15rem 0.35rem; /* Optimized padding */
            font-size: 0.55rem; /* Smaller but readable font */
            font-weight: 600;
            border: 1px solid #d0d0d0;
            text-transform: uppercase;
            letter-spacing: 0.01em;
            line-height: 1.1;
            white-space: nowrap;
            border-radius: 3px;
            transition: all 0.2s ease;
        }

        .specialty-tag:hover {
            background: #ecece6;
            border-color: #c0a987;
            transform: translateY(-1px);
        }

        /* IMPROVED: Compact footer with better button layout */
        .helper-footer {
            padding: 0.8rem;
            border-top: 1px solid #d0d0d0;
            background: #ffffff;
            display: flex;
            flex-direction: column;
            gap: 0.6rem;
        }

        .price-section {
            text-align: center;
        }

        .helper-price {
            font-weight: 800;
            color: #c0a987;
            font-size: 0.9rem; /* Slightly smaller */
            line-height: 1;
            margin-bottom: 0.2rem;
        }

        .price-note {
            font-size: 0.65rem; /* Smaller */
            color: #4a4a4a;
            font-weight: 500;
        }

        /* IMPROVED: Better button layout */
        .action-buttons {
            display: flex;
            gap: 0.4rem;
        }

        .btn-book, .btn-hire {
            color: white;
            text-decoration: none;
            padding: 0.6rem 0.8rem; /* More compact */
            font-weight: 700;
            font-size: 0.75rem; /* Smaller font */
            transition: all 0.3s ease;
            text-align: center;
            border: none;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            flex: 1;
            border-radius: 4px;
        }

        .btn-book {
            background: #4a4a4a;
        }

        .btn-book:hover {
            background: #1a1a1a;
            transform: translateY(-1px);
        }

        .btn-hire {
            background: #c0a987;
        }

        .btn-hire:hover {
            background: #a68e6e;
            transform: translateY(-1px);
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #4a4a4a;
            grid-column: 1 / -1;
            background: #ecece6;
            border: 1px solid #d0d0d0;
        }

        .empty-state i {
            font-size: 4rem;
            color: #c0a987;
            margin-bottom: 1.5rem;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #1a1a1a;
            font-weight: 800;
            text-transform: uppercase;
        }

        .empty-state p {
            font-size: 1rem;
            max-width: 500px;
            margin: 0 auto 2rem;
            line-height: 1.6;
            font-weight: 500;
        }

        /* Error/Success messages */
        .error-message, .success-message {
            padding: 1.5rem;
            margin-bottom: 2rem;
            font-size: 1rem;
            font-weight: 600;
            border: 2px solid;
        }

        .error-message {
            background: #fee2e2;
            border-color: #ef4444;
            color: #dc2626;
        }

        .success-message {
            background: #dcfce7;
            border-color: #22c55e;
            color: #16a34a;
        }

        /* Fade-in animations */
        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* IMPROVED: Responsive adjustments for skill display */
        @media (max-width: 1200px) {
            .booking-section {
                max-width: 100%;
                padding: 2rem 1.5rem;
            }
            
            .helper-list {
                grid-template-columns: repeat(3, 1fr);
            }
            
            .specialty-tag {
                font-size: 0.5rem;
                padding: 0.1rem 0.3rem;
            }
        }

        @media (max-width: 1024px) {
            .search-form {
                grid-template-columns: 2fr 1fr auto;
                gap: 1rem;
            }

            .booking-section {
                gap: 1.5rem;
            }

            .sidebar {
                width: 280px;
            }
            
            .helper-list {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .specialty-tag {
                font-size: 0.55rem;
                padding: 0.15rem 0.35rem;
            }
        }

        @media (max-width: 768px) {
            .hero {
                min-height: 50vh;
                padding-top: 60px;
            }

            .hero-container {
                grid-template-columns: 1fr;
                gap: 3rem;
                text-align: center;
            }

            .hero-title {
                font-size: 2.5rem;
            }

            .hero-subtitle {
                font-size: 1.1rem;
                max-width: 100%;
            }

            .booking-section {
                flex-direction: column;
                padding: 2rem 1rem;
            }

            .sidebar {
                width: 100%;
                position: static;
                margin-bottom: 2rem;
                height: auto;
                max-height: 500px;
            }

            .search-form {
                grid-template-columns: 1fr;
                gap: 1rem;
                padding: 1.5rem;
            }

            .content-header {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }

            .booking-title {
                font-size: 2.2rem;
            }

            .sort-options {
                width: 100%;
                justify-content: flex-end;
            }

            .helper-list {
                grid-template-columns: repeat(2, 1fr);
                gap: 1rem;
            }

            .floating-icon {
                display: none;
            }
        }

        @media (max-width: 480px) {
            .hero-title {
                font-size: 2rem;
            }

            .hero-subtitle {
                font-size: 0.95rem;
            }

            .booking-section {
                padding: 1.5rem 0.5rem;
            }

            .helper-info {
                padding: 1rem;
            }

            .helper-name {
                font-size: 0.9rem;
            }

            .helper-price {
                font-size: 0.85rem;
            }
            
            .helper-list {
                grid-template-columns: 1fr;
                gap: 1rem;
            }
            
            .booking-title {
                font-size: 1.8rem;
            }

            .sidebar {
                max-height: 400px;
            }

            .filter-group {
                padding: 1.5rem;
            }

            .action-buttons {
                flex-direction: column;
                gap: 0.4rem;
            }

            .btn-book, .btn-hire {
                width: 100%;
                padding: 0.7rem;
                font-size: 0.8rem;
            }
        }

        /* Loading state */
        body {
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        body.loaded {
            opacity: 1;
        }
    </style>
</head>
<body>
    <%-- Include header --%>
    <%@ include file="../../common/web/header.jsp" %>

    <!-- Hero Section with Banner Style -->
    <section class="hero">
        <div class="hero-container">
            <div class="hero-content">
                <h1 class="hero-title animate__animated animate__fadeInLeft">
                    Thuê Nhân Viên Dọn Dẹp Chuyên Nghiệp
                </h1>
                <p class="hero-subtitle animate__animated animate__fadeInLeft animate__delay-1s">
                    Kết nối với đội ngũ giúp việc uy tín, đáng tin cậy tại Đà Nẵng. 
                    Dịch vụ chất lượng cao với giá cả hợp lý, mang đến không gian sống sạch sẽ và thoải mái.
                </p>
                <div class="hero-cta animate__animated animate__fadeInLeft animate__delay-2s">
                    <a href="#search" class="btn btn-primary">
                        <i class="fas fa-search" style="margin-right: 0.5rem;"></i>
                        Tìm kiếm ngay
                    </a>
                    <a href="#filters" class="btn btn-secondary">
                        Xem tất cả dịch vụ
                    </a>
                </div>
            </div>
            <div class="hero-visual animate__animated animate__fadeInRight animate__delay-1s">
                <img src="${pageContext.request.contextPath}/view/assets/home/img/banner/banner.jpg" alt="Giúp việc chuyên nghiệp" class="hero-banner">
                <div class="floating-elements">
                    <div class="floating-icon">
                        <i class="fas fa-broom"></i>
                    </div>
                    <div class="floating-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="floating-icon">
                        <i class="fas fa-star"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Search Section -->
    <section class="search-section" id="search">
        <div class="search-container">
            <form class="search-form" method="POST" action="${pageContext.request.contextPath}/hire">
                <input type="hidden" name="action" value="search">
                
                <div class="form-group search-input">
                    <label for="search">Tìm kiếm nhân viên</label>
                    <i class="fas fa-search"></i>
                    <input type="text" id="search" name="search" 
                           value="${param.search}" 
                           placeholder="Tìm theo tên hoặc địa điểm..." />
                </div>
                
                <div class="form-group">
                    <label for="district">Quận/Huyện</label>
                    <select id="district" name="district">
                        <option value="">Tất cả khu vực</option>
                        <option value="Hai Chau" ${param.area == 'Hai Chau' || param.district == 'Hai Chau' ? 'selected' : ''}>Hải Châu</option>
                        <option value="Thanh Khe" ${param.area == 'Thanh Khe' || param.district == 'Thanh Khe' ? 'selected' : ''}>Thanh Khê</option>
                        <option value="Son Tra" ${param.area == 'Son Tra' || param.district == 'Son Tra' ? 'selected' : ''}>Sơn Trà</option>
                        <option value="Ngu Hanh Son" ${param.area == 'Ngu Hanh Son' || param.district == 'Ngu Hanh Son' ? 'selected' : ''}>Ngũ Hành Sơn</option>
                        <option value="Lien Chieu" ${param.area == 'Lien Chieu' || param.district == 'Lien Chieu' ? 'selected' : ''}>Liên Chiểu</option>
                        <option value="Cam Le" ${param.area == 'Cam Le' || param.district == 'Cam Le' ? 'selected' : ''}>Cẩm Lệ</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="time">Thời gian làm việc</label>
                    <select id="time" name="time">
                        <option value="">Tất cả thời gian</option>
                        <option value="morning" ${param.time == 'morning' ? 'selected' : ''}>Buổi sáng (6h-12h)</option>
                        <option value="afternoon" ${param.time == 'afternoon' ? 'selected' : ''}>Buổi chiều (12h-18h)</option>
                        <option value="evening" ${param.time == 'evening' ? 'selected' : ''}>Buổi tối (18h-22h)</option>
                        <option value="fullday" ${param.time == 'fullday' ? 'selected' : ''}>Cả ngày</option>
                    </select>
                </div>
                
                <button type="submit" class="btn btn-search">
                    <i class="fas fa-search"></i>
                    Tìm kiếm
                </button>
            </form>
        </div>
    </section>

    <!-- Main Content -->
    <section class="booking-section">
        <!-- Sidebar with Scrollable Content -->
        <div class="sidebar" id="filters">
            <div class="sidebar-header">
                <h3 class="sidebar-title">
                    <i class="fas fa-filter"></i>
                    Bộ lọc tìm kiếm
                </h3>
            </div>
            
            <div class="sidebar-content">
                <!-- Traditional checkbox filters - Complete List -->
                <div class="filter-group">
                    <div class="filter-title">Chi tiết dịch vụ</div>
                    <ul class="service-list">
                        <li>
                            <input type="checkbox" id="service-hourly" name="services" value="Giup viec theo gio">
                            <label for="service-hourly">Giúp việc theo giờ</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-daily" name="services" value="Giup viec theo ngay">
                            <label for="service-daily">Giúp việc theo ngày</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-monthly" name="services" value="Giup viec theo thang">
                            <label for="service-monthly">Giúp việc theo tháng</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-cleaning" name="services" value="Tong ve sinh">
                            <label for="service-cleaning">Tổng vệ sinh</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-carpet" name="services" value="Ve sinh tham, ghe sofa">
                            <label for="service-carpet">Vệ sinh thảm, ghế sofa</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-ac" name="services" value="Ve sinh may lanh">
                            <label for="service-ac">Vệ sinh máy lạnh</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-washer" name="services" value="Ve sinh may giat">
                            <label for="service-washer">Vệ sinh máy giặt</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-elderly" name="services" value="Cham soc nguoi gia">
                            <label for="service-elderly">Chăm sóc người già</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-childcare" name="services" value="Cham soc tre em">
                            <label for="service-childcare">Chăm sóc trẻ em</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-patient" name="services" value="Cham soc nguoi benh">
                            <label for="service-patient">Chăm sóc người bệnh</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-cooking" name="services" value="Nau an">
                            <label for="service-cooking">Nấu ăn</label>
                        </li>
                    </ul>
                </div>
                
                <div class="filter-group">
                    <div class="filter-title">Mức giá (VNĐ/giờ)</div>
                    <div class="price-range">
                        <div class="price-inputs">
                            <input type="number" placeholder="Từ" min="100000" max="300000" step="10000" 
                                   id="minPrice" name="minPrice" value="${param.minPrice}">
                            <span>-</span>
                            <input type="number" placeholder="Đến" min="100000" max="300000" step="10000" 
                                   id="maxPrice" name="maxPrice" value="${param.maxPrice}">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Display messages -->
            <c:if test="${not empty errorMessage}">
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i>
                    ${errorMessage}
                </div>
            </c:if>
            
            <c:if test="${not empty successMessage}">
                <div class="success-message">
                    <i class="fas fa-check-circle"></i>
                    ${successMessage}
                </div>
            </c:if>

            <!-- Filter Status Indicator -->
            <c:if test="${searchPerformed && not empty param.service}">
                <div class="filter-status">
                    <i class="fas fa-filter"></i>
                    Đang lọc theo dịch vụ: <strong>${param.service}</strong>
                    <button type="button" class="clear-filters" onclick="clearServiceFilter()">
                        Xóa bộ lọc
                    </button>
                </div>
            </c:if>

            <div class="content-header">
                <div>
                    <h2 class="booking-title">
                        <c:choose>
                            <c:when test="${not empty param.service}">
                                ${param.service}
                            </c:when>
                            <c:otherwise>
                                Giúp Việc Uy Tín
                            </c:otherwise>
                        </c:choose>
                    </h2>
                    <p class="results-count">
                        <c:choose>
                            <c:when test="${not empty housekeepers}">
                                Tìm thấy <strong>${housekeepers.size()}</strong> nhân viên phù hợp
                                <c:if test="${not empty param.service}">
                                    cho dịch vụ "<strong>${param.service}</strong>"
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                Không tìm thấy nhân viên phù hợp
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <div class="sort-options">
                    <label for="sort">Sắp xếp theo:</label>
                    <select id="sort" class="sort-select">
                        <option value="rating">Đánh giá cao nhất</option>
                        <option value="price-low">Giá thấp đến cao</option>
                        <option value="price-high">Giá cao đến thấp</option>
                        <option value="experience">Kinh nghiệm nhiều nhất</option>
                        <option value="bookings">Đặt lịch nhiều nhất</option>
                    </select>
                </div>
            </div>

            <!-- IMPROVED: Housekeepers List - Optimized 4 per row -->
            <div class="helper-list" id="helperList">
                <c:choose>
                    <c:when test="${not empty housekeepers and fn:length(housekeepers) > 0}">
                        <c:forEach var="housekeeper" items="${housekeepers}" varStatus="status">
                            <div class="helper-card fade-in" 
                                 data-skills="${housekeeper.skills}" 
                                 data-price="${housekeeper.hourlyRate}"
                                 data-rating="${housekeeper.averageRating}"
                                 data-experience="${housekeeper.experienceYears}"
                                 data-bookings="${housekeeper.bookingCount}"
                                 data-index="${status.index}">
                                
                                <!-- IMPROVED: Larger image container -->
                                <div class="helper-image-container">
                                    <img src="${pageContext.request.contextPath}/${housekeeper.profileImageUrl}" 
                                         alt="${housekeeper.fullName}" 
                                         class="helper-image"
                                         onerror="this.src='${pageContext.request.contextPath}/view/assets/profile/default.jpg'">
                                    
                                    <c:if test="${housekeeper.active}">
                                        <div class="helper-status">Có sẵn</div>
                                    </c:if>
                                    
                                    <c:if test="${housekeeper.hasDiscount}">
                                        <div class="helper-discount">Ưu đãi</div>
                                    </c:if>
                                </div>
                                
                                <!-- IMPROVED: Compact info section -->
                                <div class="helper-info">
                                    <div class="helper-header">
                                        <div class="helper-name">${housekeeper.fullName}</div>
                                        <div class="helper-location">
                                            <i class="fas fa-map-marker-alt"></i>
                                            ${housekeeper.workAreas}, Đà Nẵng
                                        </div>
                                        <div class="helper-rating">
                                            <i class="fas fa-star"></i>
                                            <span>
                                                <c:choose>
                                                    <c:when test="${housekeeper.averageRating != null}">
                                                        <fmt:formatNumber value="${housekeeper.averageRating}" pattern="#.#" minFractionDigits="1"/>
                                                    </c:when>
                                                    <c:otherwise>4.0</c:otherwise>
                                                </c:choose>
                                                (${housekeeper.bookingCount} đánh giá)
                                            </span>
                                        </div>
                                    </div>
                                    
                                    <!-- IMPROVED: Show ALL skills without truncation -->
                                    <div class="helper-specialties">
                                        <div class="specialty-tags">
                                            <c:choose>
                                                <c:when test="${not empty housekeeper.skills}">
                                                    <!-- Display ALL skills -->
                                                    <c:forEach var="skill" items="${fn:split(housekeeper.skills, ',')}" varStatus="skillStatus">
                                                        <span class="specialty-tag" title="${fn:trim(skill)}">${fn:trim(skill)}</span>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="specialty-tag">Giúp việc nhà</span>
                                                    <span class="specialty-tag">Dọn dẹp</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- IMPROVED: Compact footer with better button layout -->
                                <div class="helper-footer">
                                    <div class="price-section">
                                        <div class="helper-price">
                                            <fmt:formatNumber value="${housekeeper.hourlyRate}" type="number" groupingUsed="true"/>đ/giờ
                                        </div>
                                        <div class="price-note">
                                            <c:choose>
                                                <c:when test="${housekeeper.experienceYears > 0}">
                                                    ${housekeeper.experienceYears} năm kinh nghiệm
                                                </c:when>
                                                <c:otherwise>Tối thiểu 2 giờ</c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <!-- IMPROVED: Side-by-side buttons -->
                                    <div class="action-buttons">
                                        <a href="${pageContext.request.contextPath}/hire/${housekeeper.userId}" class="btn-book">Chi tiết</a>
                                        <a href="${pageContext.request.contextPath}/booking?housekeeperId=${housekeeper.userId}" class="btn-hire">Thuê ngay</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="fas fa-search"></i>
                            <h3>Không tìm thấy người giúp việc</h3>
                            <p>
                                <c:choose>
                                    <c:when test="${searchPerformed == true}">
                                        Không có người giúp việc nào phù hợp với tiêu chí tìm kiếm của bạn. 
                                        Vui lòng thử điều chỉnh bộ lọc hoặc tìm kiếm với từ khóa khác.
                                    </c:when>
                                    <c:otherwise>
                                        Hiện tại chưa có người giúp việc nào trong hệ thống. 
                                        Vui lòng quay lại sau.
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <a href="${pageContext.request.contextPath}/hire" class="btn btn-primary" style="margin-top: 1rem;">
                                Tải lại trang
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>

    <%-- Include footer --%>
    <%@ include file="../../common/web/footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Set body as loaded for smooth transition
            document.body.classList.add('loaded');

            // Form elements
            const searchForm = document.querySelector('.search-form');
            const serviceCheckboxes = document.querySelectorAll('.service-list input[name="services"]');
            const sortSelect = document.getElementById('sort');
            const minPriceInput = document.getElementById('minPrice');
            const maxPriceInput = document.getElementById('maxPrice');
            const helperCards = document.querySelectorAll('.helper-card');
            const helperList = document.getElementById('helperList');

            // Enhanced Intersection Observer for animations
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }
                });
            }, observerOptions);

            // Observe all fade-in elements
            document.querySelectorAll('.fade-in').forEach((element, index) => {
                element.style.transitionDelay = `${index * 0.1}s`;
                observer.observe(element);
            });

            // Event listeners
            if (sortSelect) {
                sortSelect.addEventListener('change', function() { 
                    sortHelpers(this.value); 
                });
            }

            // Client-side filtering for better UX
            serviceCheckboxes.forEach(checkbox => {
                checkbox.addEventListener('change', debounce(filterHelpers, 300));
            });

            [minPriceInput, maxPriceInput].forEach(input => {
                if (input) {
                    input.addEventListener('input', debounce(filterHelpers, 300));
                }
            });

            // Enhanced filter functionality
            function filterHelpers() {
                const minPrice = parseInt(minPriceInput?.value) || 0;
                const maxPrice = parseInt(maxPriceInput?.value) || Infinity;
                const selectedServices = Array.from(serviceCheckboxes)
                    .filter(checkbox => checkbox.checked)
                    .map(checkbox => checkbox.value.toLowerCase());

                let visibleCount = 0;

                helperCards.forEach(card => {
                    const skills = card.dataset.skills || '';
                    const priceText = card.querySelector('.helper-price')?.textContent.replace(/[^0-9]/g, '');
                    const price = parseInt(priceText) || 0;

                    // Apply filters
                    const matchesPrice = price >= minPrice && price <= maxPrice;
                    
                    const matchesService = selectedServices.length === 0 || 
                        selectedServices.some(service => 
                            skills.toLowerCase().includes(service) || 
                            removeVietnameseAccents(skills.toLowerCase()).includes(removeVietnameseAccents(service))
                        );

                    const isVisible = matchesPrice && matchesService;

                    card.style.display = isVisible ? 'block' : 'none';
                    if (isVisible) visibleCount++;
                });

                updateResultsCount(visibleCount);
            }

            // Enhanced sort functionality
            function sortHelpers(sortBy) {
                const cards = Array.from(helperCards);
                
                cards.sort((a, b) => {
                    switch (sortBy) {
                        case 'rating':
                            const ratingA = parseFloat(a.dataset.rating) || 0;
                            const ratingB = parseFloat(b.dataset.rating) || 0;
                            return ratingB - ratingA;
                            
                        case 'price-low':
                            const priceA = parseInt(a.dataset.price) || 0;
                            const priceB = parseInt(b.dataset.price) || 0;
                            return priceA - priceB;
                            
                        case 'price-high':
                            const priceHighA = parseInt(a.dataset.price) || 0;
                            const priceHighB = parseInt(b.dataset.price) || 0;
                            return priceHighB - priceHighA;
                            
                        case 'experience':
                            const expA = parseInt(a.dataset.experience) || 0;
                            const expB = parseInt(b.dataset.experience) || 0;
                            return expB - expA;
                            
                        case 'bookings':
                            const bookingsA = parseInt(a.dataset.bookings) || 0;
                            const bookingsB = parseInt(b.dataset.bookings) || 0;
                            return bookingsB - bookingsA;
                            
                        default:
                            return 0;
                    }
                });

                // Clear and re-append sorted cards with staggered animation
                if (helperList) {
                    helperList.innerHTML = '';
                    cards.forEach((card, index) => {
                        card.style.transitionDelay = `${index * 0.05}s`;
                        helperList.appendChild(card);
                    });
                }
            }

            // Helper functions
            function removeVietnameseAccents(str) {
                return str.normalize('NFD')
                         .replace(/[\u0300-\u036f]/g, '')
                         .replace(/đ/g, 'd').replace(/Đ/g, 'D');
            }

            // Update results count
            function updateResultsCount(count) {
                const resultsElement = document.querySelector('.results-count');
                if (resultsElement) {
                    if (count === 0) {
                        resultsElement.innerHTML = 'Không tìm thấy nhân viên phù hợp';
                    } else {
                        resultsElement.innerHTML = `Tìm thấy <strong>${count}</strong> nhân viên phù hợp`;
                    }
                }
            }

            // Debounce function for search optimization
            function debounce(func, wait) {
                let timeout;
                return function executedFunction(...args) {
                    const later = () => {
                        clearTimeout(timeout);
                        func(...args);
                    };
                    clearTimeout(timeout);
                    timeout = setTimeout(later, wait);
                };
            }

            // Add smooth scroll behavior for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });

            // Initialize page
            if (helperCards.length > 0) {
                updateResultsCount(helperCards.length);
            }

            console.log('🏠 Hire page loaded successfully with', helperCards.length, 'housekeepers');
            console.log('🎨 UI simplified: removed quick filter buttons, kept detailed service filters');
        });

        // Global functions for service filtering (simplified)
        function clearServiceFilter() {
            const currentUrl = new URL(window.location);
            currentUrl.searchParams.delete('service');
            window.location.href = currentUrl.toString();
        }
    </script>
</body>
</html>