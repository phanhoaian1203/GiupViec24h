<%@ page contentType="text/html; charset=UTF-8" %>
<style>
    .sidebar {
        width: 280px;
        background: linear-gradient(180deg, #2d3748 0%, #1a202c 100%);
        color: white;
        padding: 0;
        position: fixed;
        height: 100%;
        box-shadow: 4px 0 20px rgba(0,0,0,0.1);
        z-index: 100;
    }
    .sidebar .logo {
        padding: 2rem 1.5rem;
        font-size: 1.4rem;
        font-weight: 800;
        text-align: center;
        border-bottom: 1px solid rgba(255,255,255,0.1);
        background: rgba(26, 179, 148, 0.1);
    }
    .sidebar .logo i {
        color: #1AB394;
        margin-right: 0.5rem;
        font-size: 1.6rem;
    }
    .sidebar ul {
        list-style: none;
        padding: 1rem 0;
    }
    .sidebar ul li {
        margin: 0.25rem 1rem;
        border-radius: 12px;
        overflow: hidden;
        transition: all 0.3s ease;
    }
    .sidebar ul li a {
        display: flex;
        align-items: center;
        padding: 1rem 1.5rem;
        color: #cbd5e0;
        text-decoration: none;
        transition: all 0.3s ease;
        position: relative;
    }
    .sidebar ul li:hover {
        background: rgba(255,255,255,0.1);
        transform: translateX(5px);
    }
    .sidebar ul li.active {
        background: linear-gradient(135deg, #1AB394 0%, #16a085 100%);
        box-shadow: 0 4px 15px rgba(26, 179, 148, 0.3);
    }
    .sidebar ul li.active a {
        color: white;
    }
    .sidebar ul li i {
        margin-right: 1rem;
        width: 20px;
        text-align: center;
        font-size: 1.1rem;
    }
    .notification-badge {
        background: #ef4444;
        color: white;
        border-radius: 50%;
        min-width: 20px;
        height: 20px;
        font-size: 0.7rem;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-left: auto;
        font-weight: 700;
        padding: 0 0.3rem;
        animation: pulse 2s infinite;
    }
    
    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.1); }
        100% { transform: scale(1); }
    }
    
    .notification-badge.hidden {
        display: none;
    }
    
    .loading-spinner {
        border: 2px solid #f3f3f3;
        border-top: 2px solid #1AB394;
        border-radius: 50%;
        width: 16px;
        height: 16px;
        animation: spin 1s linear infinite;
        margin-left: auto;
    }
    
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
    
    @media (max-width: 1024px) {
        .sidebar {
            transform: translateX(-100%);
            transition: transform 0.3s ease;
        }
        .sidebar.open {
            transform: translateX(0);
        }
    }
    
    /* Error state styles */
    .notification-badge.error {
        background: #6b7280;
        color: #f3f4f6;
        animation: none;
    }
</style>

<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<div class="sidebar">
    <div class="logo">
        <i class="fas fa-home"></i>
        Giúp Việc 24H
    </div>
    <ul>
        <li class="${param.activePage == 'dashboard' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/staffDashboard.jsp">
                <i class="fas fa-tachometer-alt"></i>
                <span>Bảng Điều Khiển</span>
            </a>
        </li>
        <li class="${param.activePage == 'contracts' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/contracts-manage.jsp">
                <i class="fas fa-file-contract"></i>
                <span>Quản Lý Hợp Đồng</span>
            </a>
        </li>
        <li class="${param.activePage == 'complaints' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/complaints-manage.jsp">
                <i class="fas fa-exclamation-circle"></i>
                <span>Giải Quyết Khiếu Nại</span>
            </a>
        </li>
        <!-- ✅ FIXED WALLET MANAGEMENT LINK -->
        <li class="${param.activePage == 'wallet' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/staff/wallet-management">
                <i class="fas fa-wallet"></i>
                <span>Quản Lý Ví Điện Tử</span>
                <!-- Dynamic notification badge -->
                <div class="notification-badge hidden" id="walletBadge">
                    <span id="badgeCount">0</span>
                </div>
                <!-- Loading spinner -->
                <div class="loading-spinner hidden" id="loadingSpinner"></div>
            </a>
        </li>
        <li class="${param.activePage == 'schedule' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/schedule-manage.jsp">
                <i class="fas fa-calendar-alt"></i>
                <span>Quản Lí Lịch Thuê</span>
            </a>
        </li>
        <li class="${param.activePage == 'vouchers' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/vouchers-manage.jsp">
                <i class="fas fa-tags"></i>
                <span>Quản Lý Voucher</span>
            </a>
        </li>
        <li class="${param.activePage == 'chat' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/staff-chat.jsp">
                <i class="fas fa-comments"></i>
                <span>Chat Hỗ Trợ</span>
            </a>
        </li>
        <li class="${param.activePage == 'users' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/users-manage.jsp">
                <i class="fas fa-users"></i>
                <span>Quản Lý Người Dùng</span>
            </a>
        </li>
        <li class="${param.activePage == 'logout' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/LogoutServlet">
                <i class="fas fa-sign-out-alt"></i>
                <span>Đăng Xuất</span>
            </a>
        </li>
    </ul>
</div>

<script>
// ✅ ENHANCED SIDEBAR SCRIPT WITH BETTER ERROR HANDLING
document.addEventListener('DOMContentLoaded', function() {
    console.log('🚀 === ENHANCED SIDEBAR SCRIPT LOADED ===');
    console.log('📍 Current page:', '<%= request.getRequestURI() %>');
    console.log('📍 Context path:', '<%= request.getContextPath() %>');
    
    // DOM Elements
    const walletLink = document.querySelector('a[href*="wallet-management"]');
    const walletBadge = document.getElementById('walletBadge');
    const badgeCount = document.getElementById('badgeCount');
    const loadingSpinner = document.getElementById('loadingSpinner');
    
    // Validation
    if (!walletLink) {
        console.error('❌ ERROR: Wallet link not found in DOM');
        return;
    }
    
    if (!walletBadge || !badgeCount) {
        console.error('❌ ERROR: Badge elements not found in DOM');
        return;
    }
    
    console.log('✅ All DOM elements found successfully');
    console.log('🔗 Wallet link URL:', walletLink.href);
    
    // Configuration
    const config = {
        apiUrl: '<%= request.getContextPath() %>/staff/wallet-management/pending-count',
        updateInterval: 30000, // 30 seconds
        retryAttempts: 3,
        retryDelay: 2000, // 2 seconds
        debugMode: true
    };
    
    console.log('⚙️ Configuration:', config);
    
    // State management
    let updateInProgress = false;
    let retryCount = 0;
    let lastSuccessfulUpdate = null;
    
    /**
     * ✅ ENHANCED function to update badge count
     */
    function updatePendingCount(showSpinner = false) {
        if (updateInProgress) {
            console.log('⏳ Update already in progress, skipping...');
            return;
        }
        
        updateInProgress = true;
        
        if (config.debugMode) {
            console.log('\n🔄 === STARTING PENDING COUNT UPDATE ===');
            console.log('🔄 Show spinner:', showSpinner);
            console.log('🔄 API URL:', config.apiUrl);
            console.log('🔄 Retry count:', retryCount + '/' + config.retryAttempts);
        }
        
        // Show loading spinner if requested
        if (showSpinner && loadingSpinner) {
            loadingSpinner.classList.remove('hidden');
            walletBadge.classList.add('hidden');
        }
        
        // Enhanced fetch with timeout and retry logic
        const controller = new AbortController();
        const timeoutId = setTimeout(() => {
            controller.abort();
            console.warn('⏰ Request timeout after 10 seconds');
        }, 10000); // 10 second timeout
        
        fetch(config.apiUrl, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Cache-Control': 'no-cache'
            },
            credentials: 'same-origin',
            signal: controller.signal
        })
        .then(response => {
            clearTimeout(timeoutId);
            
            if (config.debugMode) {
                console.log('📡 Response received:');
                console.log('   ✅ Status:', response.status);
                console.log('   ✅ Status Text:', response.statusText);
                console.log('   ✅ Content Type:', response.headers.get('Content-Type'));
            }
            
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }
            
            const contentType = response.headers.get('Content-Type') || '';
            if (!contentType.includes('application/json')) {
                console.warn('⚠️ WARNING: Response is not JSON, content type:', contentType);
                return response.text().then(text => {
                    console.log('📄 Response text:', text);
                    throw new Error('Invalid response format - expected JSON, got: ' + contentType);
                });
            }
            
            return response.json();
        })
        .then(data => {
            if (config.debugMode) {
                console.log('📊 Data parsed successfully:', data);
            }
            
            if (data.success) {
                const totalPending = parseInt(data.total_pending) || 0;
                const pendingDeposits = parseInt(data.pending_deposits) || 0;
                const pendingWithdrawals = parseInt(data.pending_withdrawals) || 0;
                
                if (config.debugMode) {
                    console.log('📈 Pending counts:');
                    console.log('   💰 Deposits:', pendingDeposits);
                    console.log('   💸 Withdrawals:', pendingWithdrawals);
                    console.log('   📊 Total:', totalPending);
                }
                
                updateBadgeDisplay(totalPending);
                
                // Reset retry count on success
                retryCount = 0;
                lastSuccessfulUpdate = new Date();
                
                console.log('✅ Badge updated successfully at', lastSuccessfulUpdate.toLocaleTimeString());
                
            } else {
                throw new Error(data.error || 'API returned success=false');
            }
        })
        .catch(error => {
            console.error('❌ Error in updatePendingCount:', error);
            
            if (config.debugMode) {
                console.error('🔍 Error details:', {
                    name: error.name,
                    message: error.message,
                    stack: error.stack
                });
            }
            
            handleUpdateError(error);
        })
        .finally(() => {
            // Hide loading spinner
            if (loadingSpinner) {
                loadingSpinner.classList.add('hidden');
            }
            
            updateInProgress = false;
            
            if (config.debugMode) {
                console.log('🏁 === END PENDING COUNT UPDATE ===\n');
            }
        });
    }
    
    /**
     * Function to update badge display
     */
    function updateBadgeDisplay(count) {
        if (count > 0) {
            badgeCount.textContent = count > 99 ? '99+' : count.toString();
            walletBadge.classList.remove('hidden', 'error');
            walletBadge.setAttribute('title', `${count} yêu cầu chờ duyệt`);
            
            if (config.debugMode) {
                console.log('🏷️ Badge shown with count:', count);
            }
        } else {
            walletBadge.classList.add('hidden');
            walletBadge.classList.remove('error');
            
            if (config.debugMode) {
                console.log('🙈 Badge hidden - no pending requests');
            }
        }
    }
    
    /**
     * Enhanced error handling with retry logic
     */
    function handleUpdateError(error) {
        retryCount++;
        
        console.log(`🔄 Handle error attempt ${retryCount}/${config.retryAttempts}`);
        
        if (retryCount <= config.retryAttempts) {
            console.log(`⏳ Retrying in ${config.retryDelay}ms...`);
            setTimeout(() => updatePendingCount(false), config.retryDelay);
        } else {
            console.error('💥 Max retry attempts reached, showing error state');
            
            // Show error state
            walletBadge.classList.add('error');
            walletBadge.classList.remove('hidden');
            badgeCount.textContent = '!';
            walletBadge.setAttribute('title', 'Lỗi kết nối - Click để thử lại');
            
            // Reset retry count after 5 minutes
            setTimeout(() => {
                retryCount = 0;
                console.log('🔄 Retry count reset');
            }, 300000);
        }
    }
    
    // ✅ EVENT LISTENERS
    
    // Wallet link click
    walletLink.addEventListener('click', function(e) {
        console.log('🖱️ Wallet link clicked:', this.href);
        
        // Update badge after navigation (with delay)
        setTimeout(() => {
            console.log('🔄 Post-navigation badge update');
            updatePendingCount(true);
        }, 1000);
    });
    
    // Click badge to retry on error
    walletBadge.addEventListener('click', function(e) {
        if (this.classList.contains('error')) {
            e.preventDefault();
            e.stopPropagation();
            console.log('🔄 Error badge clicked - retrying...');
            retryCount = 0;
            updatePendingCount(true);
        }
    });
    
    // ✅ INITIALIZE
    
    // Initialize badge with server-side data if available
    <% 
        Integer totalPendingRequests = (Integer) request.getAttribute("totalPendingRequests");
        if (totalPendingRequests != null && totalPendingRequests > 0) {
    %>
    console.log('🎯 Server-side data available:', <%= totalPendingRequests %>);
    updateBadgeDisplay(<%= totalPendingRequests %>);
    <% } else { %>
    console.log('🔍 No server-side pending requests data');
    walletBadge.classList.add('hidden');
    <% } %>
    
    // Start initial update
    console.log('🚀 Starting initial update...');
    updatePendingCount(true);
    
    // Set up periodic updates
    const updateInterval = setInterval(() => {
        if (config.debugMode) {
            console.log('⏰ Periodic update triggered');
        }
        updatePendingCount(false);
    }, config.updateInterval);
    
    console.log(`⏰ Periodic updates scheduled every ${config.updateInterval/1000} seconds`);
    
    // ✅ CLEANUP AND VISIBILITY HANDLING
    
    // Cleanup on page unload
    window.addEventListener('beforeunload', () => {
        console.log('👋 Page unloading - cleaning up intervals');
        clearInterval(updateInterval);
    });
    
    // Visibility API - pause updates when tab is not active
    document.addEventListener('visibilitychange', () => {
        if (document.visibilityState === 'visible') {
            console.log('👁️ Tab became visible - updating badge');
            updatePendingCount(false);
        } else {
            console.log('🙈 Tab became hidden - pausing updates');
        }
    });
    
    console.log('✅ === SIDEBAR INITIALIZATION COMPLETE ===');
});

// ✅ GLOBAL UTILITY FUNCTIONS FOR DEBUGGING

window.debugSidebar = function() {
    console.log('\n🔍 === SIDEBAR DEBUG INFO ===');
    console.log('🏷️ Badge element:', document.getElementById('walletBadge'));
    console.log('🔢 Count element:', document.getElementById('badgeCount'));
    console.log('📝 Current badge text:', document.getElementById('badgeCount')?.textContent);
    console.log('🎨 Badge classes:', document.getElementById('walletBadge')?.className);
    console.log('👁️ Badge hidden?', document.getElementById('walletBadge')?.classList.contains('hidden'));
    console.log('❌ Badge error state?', document.getElementById('walletBadge')?.classList.contains('error'));
    console.log('⏰ Last successful update:', window.lastSuccessfulUpdate);
    console.log('=========================\n');
};

window.testWalletAPI = function() {
    console.log('\n🧪 === TESTING WALLET API ===');
    const apiUrl = '<%= request.getContextPath() %>/staff/wallet-management/pending-count';
    console.log('🔗 Testing URL:', apiUrl);
    
    fetch(apiUrl, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
        credentials: 'same-origin'
    })
    .then(response => {
        console.log('✅ Test Response Status:', response.status);
        console.log('✅ Test Response OK:', response.ok);
        console.log('✅ Test Response Headers:', Object.fromEntries(response.headers));
        return response.text();
    })
    .then(text => {
        console.log('✅ Test Response Text:', text);
        try {
            const json = JSON.parse(text);
            console.log('✅ Test Parsed JSON:', json);
        } catch (e) {
            console.log('❌ Test JSON Parse Error:', e.message);
        }
    })
    .catch(error => {
        console.error('❌ Test API Error:', error);
    });
    console.log('=========================\n');
};

window.forceUpdateBadge = function() {
    console.log('🔄 === FORCING BADGE UPDATE ===');
    // Trigger manual update by calling the main function
    if (typeof updatePendingCount === 'function') {
        updatePendingCount(true);
    } else {
        console.error('❌ updatePendingCount function not available');
    }
};

// Mobile sidebar toggle function
function toggleSidebar() {
    const sidebar = document.querySelector('.sidebar');
    sidebar.classList.toggle('open');
    console.log('📱 Sidebar toggled:', sidebar.classList.contains('open') ? 'open' : 'closed');
}
</script>