// script.js

document.addEventListener('DOMContentLoaded', function() {
    var input = document.querySelector("#mobile_code");

    // Initialize the intlTelInput
    var iti = window.intlTelInput(input, {
        initialCountry: "in",
        separateDialCode: true,
        utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/js/utils.js"
    });
});
