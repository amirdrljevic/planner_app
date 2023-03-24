document.addEventListener("DOMContentLoaded", function() {
    const sidebarMenu = document.getElementById("sidebarMenu");
    const collapseButton = document.getElementById("sidebarCollapse");
  
    collapseButton.addEventListener("click", function() {
      sidebarMenu.classList.toggle("collapsed-sidebar");
    });
  });
  