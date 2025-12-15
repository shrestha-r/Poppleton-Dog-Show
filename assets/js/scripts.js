/* ===== HEADER BEHAVIOUR ===== */
(function(){
  const hamburger = document.querySelector('.hamburger');
  const mobileNav = document.querySelector('.mobile-nav');
  const accountBtn = document.querySelector('.account-toggle');
  const accountBox = document.querySelector('.account-dropdown');

  /* hamburger / mobile nav */
  if (hamburger) {
    hamburger.addEventListener('click', () => {
      mobileNav.classList.toggle('show');
      hamburger.textContent = mobileNav.classList.contains('show') ? '✕' : '☰';
    });
  }

  /* account dropdown */
  if (accountBtn && accountBox) {
    accountBtn.addEventListener('click', () => accountBox.classList.toggle('show'));
    document.addEventListener('click', e => {
      if (!e.target.closest('.account-area')) accountBox.classList.remove('show');
    });
  }
})();

/* ===== INDEX LIVE SEARCH ===== */
(function(){
  const searchInput = document.getElementById('dogSearch');
  const table = document.getElementById('dogTable');
  if (!searchInput || !table) return;
  const rows = Array.from(table.tBodies[0].rows);
  searchInput.addEventListener('input', () => {
    const term = searchInput.value.toLowerCase();
    rows.forEach(r => r.style.display = r.textContent.toLowerCase().includes(term) ? '' : 'none');
  });
})();