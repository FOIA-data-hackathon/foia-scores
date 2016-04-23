$(document).foundation();

var foiascoreApp = angular.module('foiascoreApp', []);


foiascoreApp.controller('agency', function ($scope, $http){ //$interval
    // $scope.getData = function(){
    //             $http.get("agencies.json?_=" + Date.now()).success(function(response){
    //             $scope.agencydata = response;
    //             console.log('fetched');
    //         });
    //     }
    // $scope.getData();
    // $interval($scope.getData, 240000); //240 secs
    $http.get("agencies.json").success(function(response){
        $scope.agencydata = response;
        console.log($scope.agencydata);
    });
});

