window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.type === 'toggleUI') {
        const container = document.getElementById('promo-container');
        
        if (data.show) {
            // Update content if provided
            if (data.content) {
                const image = document.querySelector('.promo-image');
                const title = document.querySelector('.promo-text h2');
                const description = document.querySelector('.promo-text p:not(.promo-tagline)');
                const tagline = document.querySelector('.promo-tagline');
                const promoBox = document.querySelector('.promo-box');
                
                // Update content
                image.src = data.content.image;
                title.textContent = data.content.title;
                description.textContent = data.content.description;
                tagline.textContent = data.content.tagline;
                
                // Update colors if provided
                if (data.content.colors) {
                    // Update text colors
                    title.style.color = data.content.colors.title;
                    description.style.color = data.content.colors.description;
                    tagline.style.color = data.content.colors.tagline;
                    
                    // Update text shadows to match the new colors
                    title.style.textShadow = `0 0 10px ${data.content.colors.title}4D`;
                    tagline.style.textShadow = `0 0 10px ${data.content.colors.tagline}4D`;

                    // Update border colors if provided
                    if (data.content.colors.border) {
                        const style = document.createElement('style');
                        const rgb = data.content.colors.border.glow;
                        
                        style.textContent = `
                            .promo-box::after {
                                background: linear-gradient(
                                    145deg,
                                    ${data.content.colors.border.primary} 0%,
                                    ${data.content.colors.border.secondary} 100%
                                );
                                box-shadow: 
                                    0 0 12px rgba(${rgb}, 0.3),
                                    0 0 24px rgba(${rgb}, 0.2);
                            }
                            .promo-image::after {
                                background: linear-gradient(
                                    145deg,
                                    ${data.content.colors.border.primary} 0%,
                                    ${data.content.colors.border.secondary} 100%
                                );
                                box-shadow: 
                                    0 0 12px rgba(${rgb}, 0.3),
                                    0 0 24px rgba(${rgb}, 0.2);
                            }
                            @keyframes borderPulse {
                                from {
                                    box-shadow: 
                                        0 0 12px rgba(${rgb}, 0.3),
                                        0 0 24px rgba(${rgb}, 0.2);
                                }
                                to {
                                    box-shadow: 
                                        0 0 16px rgba(${rgb}, 0.4),
                                        0 0 32px rgba(${rgb}, 0.3);
                                }
                            }
                            @keyframes imageBorderPulse {
                                from {
                                    box-shadow: 
                                        0 0 12px rgba(${rgb}, 0.3),
                                        0 0 24px rgba(${rgb}, 0.2);
                                }
                                to {
                                    box-shadow: 
                                        0 0 16px rgba(${rgb}, 0.4),
                                        0 0 32px rgba(${rgb}, 0.3);
                                }
                            }
                        `;
                        
                        // Remove any previous custom styles
                        const oldStyle = document.getElementById('dynamic-border-style');
                        if (oldStyle) {
                            oldStyle.remove();
                        }
                        
                        // Add new styles
                        style.id = 'dynamic-border-style';
                        document.head.appendChild(style);
                    }
                }
            }
            
            container.classList.remove('hidden');
        } else {
            container.classList.add('hidden');
        }
    }
});

// Close UI when ESC is pressed
document.addEventListener('keyup', function(event) {
    if (event.key === 'Escape') {
        fetch(`https://${GetParentResourceName()}/closeUI`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({})
        });
    }
}); 