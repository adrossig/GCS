$(document).ready(function() 
{
    GCS.Subscribe('sounds/play_sound', (args) => 
    {
        const audio = new Audio(`sounds/${args.name}.ogg`);
        audio.volume = args.volume;
        audio.play();
    })
})
