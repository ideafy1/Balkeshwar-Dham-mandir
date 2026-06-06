$files = "index.html", "about.html", "contact.html", "donation.html"
foreach ($f in $files) {
    if (Test-Path $f) {
        $c = Get-Content -Raw $f
        
        # Remove top bar
        $c = $c -replace '(?s)<section id="top".*?</section>', ''
        
        # Remove Dropdowns
        $c = $c -replace '(?s)<li class="nav-item dropdown">\s*<a class="nav-link dropdown-toggle"[^>]*>\s*Events.*?</ul>\s*</li>', ''
        $c = $c -replace '(?s)<li class="nav-item dropdown">\s*<a class="nav-link dropdown-toggle"[^>]*>\s*Product.*?</ul>\s*</li>', ''
        $c = $c -replace '(?s)<li class="nav-item dropdown">\s*<a class="nav-link dropdown-toggle"[^>]*>\s*Blog.*?</ul>\s*</li>', ''
        $c = $c -replace '(?s)<li class="nav-item dropdown">\s*<a class="nav-link dropdown-toggle"[^>]*>\s*Pages.*?</ul>\s*</li>', ''
        
        # Replace Donation dropdown with simple link
        $c = $c -replace '(?s)<li class="nav-item dropdown">\s*<a class="nav-link dropdown-toggle"[^>]*>\s*Donation.*?</ul>\s*</li>', '<li class="nav-item"><a class="nav-link" href="donation.html">Donation (दान)</a></li>'
        
        # Remove Shopping cart
        $c = $c -replace '(?s)<li class="nav-item dropdown">\s*<a class="nav-link dropdown-toggle drop_togn nav_hide fs-6".*?</ul>\s*</li>', ''
        
        # Rewrite to Hindi / Bal Krishna specific
        $c = $c -replace 'God give us power to believe', 'जय श्री कृष्णा - बाल स्वरूप'
        $c = $c -replace 'alias veritatis nostrum iste sed', 'बालकेश्वर धाम खोंखरा में आपका स्वागत है'
        $c = $c -replace 'Lorem ipsum dolor sit, amet', 'नटखट नंदलाल की कृपा'
        $c = $c -replace 'Ac mi duis mollis. Sapiente\? Scelerisque quae, penatibus\? Suscipit class corporis nostra rem quos voluptatibus habitant\? Fames, vivamus minim nemo enim, gravida lobortis quasi, eum.', 'यह धाम श्री कृष्ण के बाल स्वरूप को समर्पित है। आइए और बाल गोपाल की मनमोहक लीलाओं का आनंद लें।'
        $c = $c -replace 'Buy Now', 'दर्शन करें'
        $c = $c -replace 'Live Stream', 'लाइव आरती'
        $c = $c -replace 'Morning Prayer', 'प्रातः आरती (मंगला आरती)'
        $c = $c -replace 'Exhortation', 'भजन कीर्तन'
        $c = $c -replace 'Counseling', 'प्रसाद वितरण'
        $c = $c -replace 'We Are A Temple <br>\s*That Believes In God.', 'बालकेश्वर धाम - <br> श्री कृष्ण का बाल स्वरूप'
        $c = $c -replace 'We are a Temple that belives in Balkeshwar Dham and the followers and We are a Temple that belives in Balkeshwar Dham', 'बालकेश्वर धाम खोंखरा में आपका स्वागत है। यह धाम बाल कृष्ण की मनमोहक लीलाओं और उनके बाल स्वरूप का प्रतीक है।'
        $c = $c -replace 'Our Live Broadcast', 'हमारी लाइव आरती और दर्शन'
        $c = $c -replace 'When our power of choice', 'श्री कृष्ण की महिमा'
        $c = $c -replace 'We are a Temple that belives in Balkeshwar Dham and the followers and We are a Temple that belives in Balkeshwar Dham. This is where you should start Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod Lorem ipsum dolor sit amet consectetur adipisicing elit, sed do eiusmod This is where you should start Lorem ipsum dolor sit amet consectetur', 'भगवान श्री कृष्ण का बाल स्वरूप अत्यंत मनमोहक और आनंददायक है। बालकेश्वर धाम में आकर आप इस आनंद की अनुभूति कर सकते हैं। यहाँ भगवान की नित्य पूजा, आरती और भजन का आयोजन होता है।'
        $c = $c -replace 'Our Ministries', 'हमारे सेवा कार्य'
        $c = $c -replace 'Make a Donation to <br> Help Community', 'मंदिर निर्माण और सेवा कार्यों में <br> अपना सहयोग दें (दान)'
        
        # Navigation translation
        $c = $c -replace 'Home', 'होम (मुख्य पृष्ठ)'
        $c = $c -replace 'About', 'हमारे बारे में'
        $c = $c -replace 'Contact Us', 'संपर्क करें'

        Set-Content -Path $f -Value $c
    }
}
