#
# Apply the math-watch attribute to any element that contains TeX that
# is inserted programmatically. The value of the attribute should be an 
# expression evaluating to the TeX to be rendered. 
# Math-watch will watch this value for changes.
#

angular.module 'mathWatch', []
  .directive 'mathWatch', <[$timeout $window]> ++ ($timeout, $window) ->

    return do
      restrict: 'A'
      replace: false
      transclude: false

      link: (scope, element, attrs) ->

        #
        # The timeout is necessary to prevent a race between mathJAX and
        # any bindings injecting TeX to be rendered. Does Angular have an
        # event indicating 'all bindings done'?
        #
        # MathJax appears to be undefined after a code change and liveReload. 
        # Not sure why we are executing before the page is completely loaded - 
        # but it appears we are. 
        # 

        _renderMath = ->
          $window.MathJax.Hub.Queue ["Typeset", $window.MathJax.Hub, element.0]

        renderMath = ->

          if $window.MathJax?
            $timeout _renderMath, 1
          else
            $window.addEventListener "load", _renderMath

        # 
        # Watch for TeX changes
        # 
        scope.$watch attrs.mathWatch, renderMath, false