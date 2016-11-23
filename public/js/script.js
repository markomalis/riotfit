docReady(function() {
  function hasClass(el, className) {
    if (el.classList)
      return el.classList.contains(className)
    else
      return !!el.className.match(new RegExp('(\\s|^)' + className + '(\\s|$)'))
  }

  function addClass(el, className) {
    if (el.classList)
      el.classList.add(className)
    else if (!hasClass(el, className)) el.className += " " + className
  }

  function removeClass(el, className) {
    if (el.classList)
      el.classList.remove(className)
    else if (hasClass(el, className)) {
      var reg = new RegExp('(\\s|^)' + className + '(\\s|$)')
      el.className=el.className.replace(reg, ' ')
    }
  }

  if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/sw.js').then(function(registration) {
      // Registration was successful
      console.log('ServiceWorker registration successful with scope: ', registration.scope);
      registration.pushManager.subscribe({userVisibleOnly:true})
      .then(function(sub) {
        var subscription_string = JSON.stringify(sub)
        console.log('subscription', subscription_string);
      })
      .catch(function(error) {
        console.log('ServiceWorker error', error);
      });
    }).catch(function(err) {
      // registration failed :(
      console.log('ServiceWorker registration failed: ', err);
    });
  }
  document.getElementById("sidemenu-toggle").addEventListener("click", menuToggle);
  document.getElementById("nav-blur").addEventListener("click", closeSidemenu);

  function menuToggle(e){
    console.log('menuToggle');
    var el = document.getElementById("sidemenu");
    if(hasClass(el, 'open')) {
      removeClass(el, 'open')
    }else{
      addClass(el, 'open');
    }
  }

  function closeSidemenu(e){
    Velocity(document.querySelectorAll("#nav-blur"), "fadeOut", { duration: 500 });
    Velocity(document.querySelectorAll("#sidemenu"), { width: '0' }, { duration: 500 });
  }

  function getCssProperty(elmId, property){
    var elem = document.getElementById(elmId);
    return window.getComputedStyle(elem,null).getPropertyValue(property);
  }
});//end tag
