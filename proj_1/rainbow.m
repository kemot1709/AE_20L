function output = rainbow(min, max, actual, min_color, max_color)
    % TODO zrobi� prawdziwy rainbow
    output = min_color + (max_color - min_color) / (max-min) *actual;

end
    