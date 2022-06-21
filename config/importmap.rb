# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tempusdominus-bootstrap-4", to: "https://ga.jspm.io/npm:tempusdominus-bootstrap-4@5.39.2/build/js/tempusdominus-bootstrap-4.js"
