var timeline = {
  "timeline": [
    {
      "type": ["instructions"],
      "pages": ["Welcome! Use the arrow buttons to browse these instructions", "Your task is to decide if a sentence is grammatically acceptable", "You will respond by moving a slider", "Press the 'Next' button to begin!"],
      "key_forward": [39],
      "key_backward": [37],
      "allow_backward": true,
      "allow_keys": true,
      "show_clickable_nav": true,
      "button_label_previous": ["Previous"],
      "button_label_next": ["Next"],
      "post_trial_gap": [200]
    },
    {
      "timeline": [
        {
          "type": ["html-slider-response"],
          "stimulus": jsPsych.timelineVariable('my_stimulus'),
          "labels": ["1", "2", "3", "4", "5", "6", "7"],
          "button_label": ["Continue"],
          "min": [1],
          "max": [7],
          "start": [4],
          "step": [1],
          "require_movement": false,
          "response_ends_trial": true,
          "post_trial_gap": [1000]
        }
      ],
      "timeline_variables": [
        {
          "my_stimulus": ["I is working hard"]
        },
        {
          "my_stimulus": ["Working hard I am"]
        },
        {
          "my_stimulus": ["I'm working hard"]
        },
        {
          "my_stimulus": ["Hard working is I"]
        }
      ],
      "randomize_order": [true]
    },
    {
      "type": ["html-keyboard-response"],
      "stimulus": ["All done! Press any key to finish"],
      "choices": jsPsych.ANY_KEY,
      "response_ends_trial": true,
      "post_trial_gap": [0]
    }
  ]
};

jsPsych.init(
{
  "timeline": [timeline],
  "on_finish": function() {
    var data = jsPsych.data.get().csv();
    var file = 'xprmntr_local_name';
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'submit');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({filename: file, filedata: data}));
  }
}
);
