angular.module "dashboard"
  .controller "MainCtrl", ($scope, $resource, $interval) ->
    getKubeStatus = () ->
      $scope.last_update = Date.now()
      $resource("/kube/api/v1beta2/nodes").get((minions) ->
        $scope.nodes = minions
      )
      $resource('/kube/api/v1beta2/pods').get((pods) ->
        $scope.pods = pods
      )

    $scope.getAllPodsOnHost = (host) ->
      if $scope.pods
        pod for pod in $scope.pods.items when pod.currentState.host is host
    $scope.getPodContainerState = (pod, containerName) ->
      return "info" if pod.currentState.status == "Waiting"
      return "success" if pod.currentState.info[containerName]?.state['running'] != null
    $interval(() ->
      getKubeStatus()
    1000 * 5)
    getKubeStatus()
