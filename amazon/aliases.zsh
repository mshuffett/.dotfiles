alias bb="brazil-build"
alias bbc="brazil-build clean"
alias bcb="brazil-build clean && brazil-build"
alias b="brazil"
alias ionpp=/apollo/env/iopmtools/bin/ion-pretty-print #pretty prints output of the next two commands
alias g2s2="/apollo/env/iopmtools/bin/g2s2 -u  http://g2s2-repo-author-na.amazon.com/" #prod command
alias g2s2cr="/apollo/env/iopmtools/bin/g2s2-post-review -u http://g2s2-repo-author-na.amazon.com/" #Code Review
alias ns='ninja-search'
alias eclipse='eclipse &>/dev/null &'
alias dw='ssh ssof-fma-pool-6001.iad6.amazon.com'

tiny() {
    if (($# == 0)); then
        local in=$(</dev/stdin)
    else
        local in=$1
    fi
    curl -G --data-urlencode "name=$in" "http://tiny/submit/url" | grep 'textarea name="url_box"' | perl -pe "s|.*url_box.*?>(.*)?<.*|\1|"
}

##########################################################
##                 Apollo Commands                      ##
##########################################################
 
 
cdl() { cd "/apollo/env/$1/var/output/logs" }
 
cde() { cd "/apollo/env/$1" }
 
cdb() { cd "/apollo/env/$1/bin" }
 
act() { sudo /apollo/bin/runCommand -a Activate -e $1 }
 
deact() { sudo /apollo/bin/runCommand -a Deactivate -e $1 }
 
react() { sudo /apollo/bin/runCommand -a Deactivate -e $1 && sudo /apollo/bin/runCommand -a Activate -e $1 }

envattach() { brazil ws --attachEnvironment --alias $1 }

cdw() { cd /workplace/$USER/$1 } #Quickly go to a workspace. Auto-complete of workspace names enabled!

envdetach() { brazil ws --detachEnvironment --alias $1 }

dateToMillis() { TZ=UTC date +%s%3N --date="$(echo "$@" | sed 's/T/ /')" }

alias dp=' /rhel5pdi/apollo/package/local_1/Linux-2.6c2.5-x86_64/JDK/JDK-6221.0-0/jdk1.7.0/bin/java -Xss18m -Dfile.encoding=UTF-8 -classpath /opt/brazil-pkg-cache/packages/DatapathQueryApplication/DatapathQueryApplication-1.0.680.26/RHEL5_64/DEV.STD.PTHREAD/build/lib/DatapathQueryApplication-1.0.jar:/opt/brazil-pkg-cache/packages/DatapathIO/DatapathIO-1.0.2508.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/DatapathIO-1.0.jar:/opt/brazil-pkg-cache/packages/Apache-HttpComponents-HttpClient/Apache-HttpComponents-HttpClient-4.2.101.1/RHEL5_64/DEV.STD.PTHREAD/build/lib/fluent-hc-4.2.3.jar:/opt/brazil-pkg-cache/packages/Apache-HttpComponents-HttpClient/Apache-HttpComponents-HttpClient-4.2.101.1/RHEL5_64/DEV.STD.PTHREAD/build/lib/httpclient-4.2.3.jar:/opt/brazil-pkg-cache/packages/Apache-HttpComponents-HttpClient/Apache-HttpComponents-HttpClient-4.2.101.1/RHEL5_64/DEV.STD.PTHREAD/build/lib/httpclient-cache-4.2.3.jar:/opt/brazil-pkg-cache/packages/Apache-HttpComponents-HttpCore/Apache-HttpComponents-HttpCore-4.2GA.335.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/httpcore-4.2.jar:/opt/brazil-pkg-cache/packages/Apache-HttpComponents-HttpCore/Apache-HttpComponents-HttpCore-4.2GA.335.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/httpcore-nio-4.2.jar:/opt/brazil-pkg-cache/packages/Apache-HttpComponents-HttpMime/Apache-HttpComponents-HttpMime-4.2.0.2/RHEL5_64/DEV.STD.PTHREAD/build/lib/httpmime-4.2.jar:/opt/brazil-pkg-cache/packages/G2S2JavaClientCache/G2S2JavaClientCache-1.0.749.2076/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2JavaClientCache-1.0.jar:/opt/brazil-pkg-cache/packages/JSableContainerCachemereAdapter/JSableContainerCachemereAdapter-1.0.4.1/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableContainerCachemereAdapter-1.0.jar:/opt/brazil-pkg-cache/packages/Cachemere/Cachemere-1.0.103.40/RHEL5_64/DEV.STD.PTHREAD/build/lib/Cachemere-1.0.jar:/opt/brazil-pkg-cache/packages/AmazonHostDiscovery/AmazonHostDiscovery-1.0.7.62/RHEL5_64/DEV.STD.PTHREAD/build/lib/AmazonHostDiscovery-1.0.jar:/opt/brazil-pkg-cache/packages/JSableRestClient/JSableRestClient-1.0.1170.76/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableRestClient-1.0.jar:/opt/brazil-pkg-cache/packages/JSableStorageResources/JSableStorageResources-1.0.135.37/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableStorageResources-1.0.jar:/opt/brazil-pkg-cache/packages/JSableContainer/JSableContainer-2.0.281.5/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableContainer-2.0.jar:/opt/brazil-pkg-cache/packages/CuracaoJava/CuracaoJava-1.0.244.5480/RHEL5_64/DEV.STD.PTHREAD/build/lib/CuracaoJava-1.0.jar:/opt/brazil-pkg-cache/packages/CacheIn/CacheIn-1.0.156.4229/RHEL5_64/DEV.STD.PTHREAD/build/lib/cacheInJava.jar:/opt/brazil-pkg-cache/packages/CacheIn/CacheIn-1.0.156.4229/RHEL5_64/DEV.STD.PTHREAD/build/lib/cacheInJavaTests.jar:/opt/brazil-pkg-cache/packages/CachewJava/CachewJava-1.0.275.4988/RHEL5_64/DEV.STD.PTHREAD/build/lib/CachewJava-tests.jar:/opt/brazil-pkg-cache/packages/CachewJava/CachewJava-1.0.275.4988/RHEL5_64/DEV.STD.PTHREAD/build/lib/CachewJava.jar:/opt/brazil-pkg-cache/packages/CuracaoMemcacheClientJava/CuracaoMemcacheClientJava-1.1.1383.3313/RHEL5_64/DEV.STD.PTHREAD/build/lib/CuracaoMemcacheClientJava-1.1.jar:/opt/brazil-pkg-cache/packages/JSableBrazilConfigProvider/JSableBrazilConfigProvider-1.0.40.6/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableBrazilConfigProvider-1.0.jar:/opt/brazil-pkg-cache/packages/JSableComputeUtilities/JSableComputeUtilities-1.0.315.5/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableComputeUtilities-1.0.jar:/opt/brazil-pkg-cache/packages/JSableConfigProvider/JSableConfigProvider-1.0.45.4/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableConfigProvider-1.0.jar:/opt/brazil-pkg-cache/packages/JSableContainerInterfaces/JSableContainerInterfaces-1.0.427.2/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableContainerInterfaces-1.0.jar:/opt/brazil-pkg-cache/packages/JSableDiagnosticFramework/JSableDiagnosticFramework-1.0.12.15/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableDiagnosticFramework-1.0.jar:/opt/brazil-pkg-cache/packages/Faraday/Faraday-1.0.222.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/Faraday-1.0.jar:/opt/brazil-pkg-cache/packages/JAXRS/JAXRS-1.1.1.70.10/RHEL5_64/DEV.STD.PTHREAD/build/lib/jsr311-api-1.1.1.jar:/opt/brazil-pkg-cache/packages/JSableDriverSableStore/JSableDriverSableStore-1.0.49.84/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableDriverSableStore-1.0.jar:/opt/brazil-pkg-cache/packages/CoralDThrottleClient/CoralDThrottleClient-1.0.1693.3704/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralDThrottleClient-1.0.jar:/opt/brazil-pkg-cache/packages/JSableGFDStumpy/JSableGFDStumpy-1.0.97.85/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableGFDStumpy-1.0.jar:/opt/brazil-pkg-cache/packages/JSableGFD/JSableGFD-1.0.103.25/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableGFD-1.0.jar:/opt/brazil-pkg-cache/packages/JSableNettyComponents/JSableNettyComponents-1.0.974.69/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableNettyComponents-1.0.jar:/opt/brazil-pkg-cache/packages/JSableBaseUnits/JSableBaseUnits-1.0.55.3/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableBaseUnits-1.0.jar:/opt/brazil-pkg-cache/packages/JSableNettyCore/JSableNettyCore-1.0.161.29/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableNettyCore-1.0.jar:/opt/brazil-pkg-cache/packages/JSableResourceConfigurator/JSableResourceConfigurator-1.0.6.73/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableResourceConfigurator-1.0.jar:/opt/brazil-pkg-cache/packages/JSableResourceInterfaces/JSableResourceInterfaces-1.0.119.3/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableResourceInterfaces-1.0.jar:/opt/brazil-pkg-cache/packages/JSableRouting/JSableRouting-1.0.20.39/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableRouting-1.0.jar:/opt/brazil-pkg-cache/packages/JSableURIFilter/JSableURIFilter-1.0.18.23/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableURIFilter-1.0.jar:/opt/brazil-pkg-cache/packages/JSableV2Metadata/JSableV2Metadata-1.0.2155.1/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableV2Metadata-1.0.jar:/opt/brazil-pkg-cache/packages/JSableMetadataCommon/JSableMetadataCommon-1.0.303.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableMetadataCommon-1.0.jar:/opt/brazil-pkg-cache/packages/JakartaCommons-math3/JakartaCommons-math3-3.1.1.1.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/commons-math-3.1-SNAPSHOT.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/com.sun.el_2.2.0.v201105051105.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/ecj-3.6.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/javax.el_2.2.0.v201105051105.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/javax.servlet.jsp.jstl_1.2.0.v201004190952.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/javax.servlet.jsp_2.2.0.v201112011158.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-ajp-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-all-8.1.0.v20120127-javadoc.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-annotations-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-client-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-continuation-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-deploy-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-http-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-io-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-jmx-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-jndi-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-overlay-deployer-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-plus-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-policy-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-rewrite-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-security-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-server-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-servlet-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-servlets-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-util-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-webapp-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-websocket-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/jetty-xml-8.1.0.v20120127.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/org.apache.jasper.glassfish_2.2.2.v201112011158.jar:/opt/brazil-pkg-cache/packages/Jetty/Jetty-8.1.0.408/RHEL5_64/DEV.STD.PTHREAD/build/lib/org.apache.taglibs.standard.glassfish_1.2.0.v201004190952.jar:/opt/brazil-pkg-cache/packages/LoadBalancingNettySableClient/LoadBalancingNettySableClient-1.0.682.1/RHEL5_64/DEV.STD.PTHREAD/build/lib/LoadBalancingNettySableClient-1.0.jar:/opt/brazil-pkg-cache/packages/JSableAAAAdapter/JSableAAAAdapter-1.0.54.3/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableAAAAdapter-1.0.jar:/opt/brazil-pkg-cache/packages/AAARuntimeJavaClient/AAARuntimeJavaClient-1.0.5607.1031/RHEL5_64/DEV.STD.PTHREAD/build/lib/AAARuntimeJavaClient-1.0.jar:/opt/brazil-pkg-cache/packages/AAACommonUtils/AAACommonUtils-1.0.2618.6841/RHEL5_64/DEV.STD.PTHREAD/build/lib/AAACommonUtils-1.0.jar:/opt/brazil-pkg-cache/packages/AAAServiceJavaClient/AAAServiceJavaClient-1.0.1322.7483/RHEL5_64/DEV.STD.PTHREAD/build/lib/AAAServiceJavaClient.jar:/opt/brazil-pkg-cache/packages/AWSCryptoJava/AWSCryptoJava-1.0.322.1026/RHEL5_64/DEV.STD.PTHREAD/build/lib/AWSCryptoJava-1.0.jar:/opt/brazil-pkg-cache/packages/AuthJava/AuthJava-1.0.1906.865/RHEL5_64/DEV.STD.PTHREAD/build/lib/AuthJava-1.0.jar:/opt/brazil-pkg-cache/packages/CoralClientBuilder/CoralClientBuilder-1.0.2481.10457/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralClientBuilder-1.0.jar:/opt/brazil-pkg-cache/packages/CoralClientHttp/CoralClientHttp-1.0.3933.2/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralClientHttp-1.0.jar:/opt/brazil-pkg-cache/packages/CoralClientNetty/CoralClientNetty-1.0.1593.8035/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralClientNetty-1.0.jar:/opt/brazil-pkg-cache/packages/AmazonSSLCiphers/AmazonSSLCiphers-1.0_JDK1.6.1.6405/RHEL5_64/DEV.STD.PTHREAD/build/lib/AmazonSSLCiphers-1.0_JDK1.6.jar:/opt/brazil-pkg-cache/packages/AmazonSSLVisitors/AmazonSSLVisitors-1.0.1.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/AmazonSSLVisitors-1.0.jar:/opt/brazil-pkg-cache/packages/CoralRpcSupport/CoralRpcSupport-1.0.3916.9196/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralRpcSupport-1.0.jar:/opt/brazil-pkg-cache/packages/CoralClient/CoralClient-1.0.4872.10063/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralClient-1.0.jar:/opt/brazil-pkg-cache/packages/CoralClientConfig/CoralClientConfig-1.0.4328.8735/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralClientConfig-1.0.jar:/opt/brazil-pkg-cache/packages/CoralCommonsSequenceFutureRetry/CoralCommonsSequenceFutureRetry-1.0.1.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralCommonsSequenceFutureRetry-1.0.jar:/opt/brazil-pkg-cache/packages/CoralCompressionEngine/CoralCompressionEngine-1.0.613.15110/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralCompressionEngine-1.0.jar:/opt/brazil-pkg-cache/packages/CoralConfig/CoralConfig-1.0.5758.6865/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralConfig-1.0.jar:/opt/brazil-pkg-cache/packages/CoralEnvelope/CoralEnvelope-1.0.1326.24980/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralEnvelope-1.0.jar:/opt/brazil-pkg-cache/packages/CoralJsonSupport/CoralJsonSupport-1.0.1465.13754/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralJsonSupport-1.0.jar:/opt/brazil-pkg-cache/packages/CoralRetry/CoralRetry-1.0.29.5944/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralRetry-1.0.jar:/opt/brazil-pkg-cache/packages/CoralService/CoralService-1.0.7610.14754/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralService-1.0.jar:/opt/brazil-pkg-cache/packages/CoralCacheValue/CoralCacheValue-1.0.1578.18578/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralCacheValue-1.0.jar:/opt/brazil-pkg-cache/packages/CoralContinuationOrchestrator/CoralContinuationOrchestrator-1.0.1519.18265/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralContinuationOrchestrator-1.0.jar:/opt/brazil-pkg-cache/packages/CoralOrchestrator/CoralOrchestrator-1.0.6427.10847/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralOrchestrator-1.0.jar:/opt/brazil-pkg-cache/packages/CoralActivity/CoralActivity-1.0.5794.3818/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralActivity-1.0.jar:/opt/brazil-pkg-cache/packages/CoralSecurity/CoralSecurity-1.0.2880.3884/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralSecurity-1.0.jar:/opt/brazil-pkg-cache/packages/CoralSerialize/CoralSerialize-1.0.2009.14817/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralSerialize-1.0.jar:/opt/brazil-pkg-cache/packages/CoralQueryStringValue/CoralQueryStringValue-1.0.1714.12028/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralQueryStringValue-1.0.jar:/opt/brazil-pkg-cache/packages/CoralTransmute/CoralTransmute-1.0.5149.8936/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralTransmute-1.0.jar:/opt/brazil-pkg-cache/packages/CoralGenericValue/CoralGenericValue-1.0.57.25310/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralGenericValue-1.0.jar:/opt/brazil-pkg-cache/packages/CoralBeanValue/CoralBeanValue-1.0.3454.10890/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralBeanValue-1.0.jar:/opt/brazil-pkg-cache/packages/CoralEnvelopeCore/CoralEnvelopeCore-1.0.2704.20797/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralEnvelopeCore-1.0.jar:/opt/brazil-pkg-cache/packages/CoralJsonValue/CoralJsonValue-1.0.3403.7587/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralJsonValue-1.0.jar:/opt/brazil-pkg-cache/packages/CoralSerializeCore/CoralSerializeCore-1.0.307.25741/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralSerializeCore-1.0.jar:/opt/brazil-pkg-cache/packages/CoralGeneric/CoralGeneric-1.0.1789.11266/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralGeneric-1.0.jar:/opt/brazil-pkg-cache/packages/CoralGenericInterface/CoralGenericInterface-1.0.1434.14868/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralGenericInterface-1.0.jar:/opt/brazil-pkg-cache/packages/CoralEnvelopeInterface/CoralEnvelopeInterface-1.0.1602.11270/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralEnvelopeInterface-1.0.jar:/opt/brazil-pkg-cache/packages/CoralSchema/CoralSchema-1.0.1261.11452/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralSchema-1.0.jar:/opt/brazil-pkg-cache/packages/CoralTibcoValue/CoralTibcoValue-1.0.2946.11052/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralTibcoValue-1.0.jar:/opt/brazil-pkg-cache/packages/CoralValidate/CoralValidate-1.0.2238.11494/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralValidate-1.0.jar:/opt/brazil-pkg-cache/packages/CoralModel/CoralModel-1.0.6636.12398/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralModel-1.0.jar:/opt/brazil-pkg-cache/packages/CoralAnnotation/CoralAnnotation-1.0.1717.6192/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralAnnotation-1.0.jar:/opt/brazil-pkg-cache/packages/CoralGrammar/CoralGrammar-1.0.4089.2/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralGrammar-1.0.jar:/opt/brazil-pkg-cache/packages/CoralBuffer/CoralBuffer-1.0.5332.1151/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralBuffer-1.0.jar:/opt/brazil-pkg-cache/packages/CoralReflect/CoralReflect-1.0.7280.5062/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralReflect-1.0.jar:/opt/brazil-pkg-cache/packages/CoralXmlValue/CoralXmlValue-1.0.3551.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralXmlValue-1.0.jar:/opt/brazil-pkg-cache/packages/CoralUtil/CoralUtil-1.0.5927.8765/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralUtil-1.0.jar:/opt/brazil-pkg-cache/packages/CoralValue/CoralValue-1.0.1878.5288/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralValue-1.0.jar:/opt/brazil-pkg-cache/packages/CoralCommons/CoralCommons-1.0.3.4332/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralCommons-1.0.jar:/opt/brazil-pkg-cache/packages/JSableCipher/JSableCipher-1.0.18.24/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableCipher-1.0.jar:/opt/brazil-pkg-cache/packages/AaaPersistenceJavaClient/AaaPersistenceJavaClient-1.0.107.2/RHEL5_64/DEV.STD.PTHREAD/build/lib/AaaPersistenceJavaClient-1.0.jar:/opt/brazil-pkg-cache/packages/AaaGletscherJava/AaaGletscherJava-1.0.123.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/AaaGletscherJava-1.0.jar:/opt/brazil-pkg-cache/packages/AAAJavaCommons/AAAJavaCommons-1.0.1854.129/RHEL5_64/DEV.STD.PTHREAD/build/lib/AAAJavaCommons-1.0.jar:/opt/brazil-pkg-cache/packages/JSableCoralMetrics/JSableCoralMetrics-1.0.257.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableCoralMetrics-1.0.jar:/opt/brazil-pkg-cache/packages/JSableMetrics/JSableMetrics-1.0.289.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableMetrics-1.0.jar:/opt/brazil-pkg-cache/packages/JSableNettyFraming/JSableNettyFraming-1.0.487.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableNettyFraming-1.0.jar:/opt/brazil-pkg-cache/packages/FindBugsAnnotations/FindBugsAnnotations-1.3.7.1130.3035/RHEL5_64/DEV.STD.PTHREAD/build/lib/findbugs-1.3.7-annotations.jar:/opt/brazil-pkg-cache/packages/FindBugsAnnotations/FindBugsAnnotations-1.3.7.1130.3035/RHEL5_64/DEV.STD.PTHREAD/build/lib/findbugs-1.3.7-jsr305.jar:/opt/brazil-pkg-cache/packages/JUnixSocket/JUnixSocket-1.5.18/RHEL5_64/DEV.STD.PTHREAD/build/lib/junixsocket-1.3.jar:/opt/brazil-pkg-cache/packages/JUnixSocket/JUnixSocket-1.5.18/RHEL5_64/DEV.STD.PTHREAD/build/lib/junixsocket-demo-1.3.jar:/opt/brazil-pkg-cache/packages/JUnixSocket/JUnixSocket-1.5.18/RHEL5_64/DEV.STD.PTHREAD/build/lib/junixsocket-mysql-1.3.jar:/opt/brazil-pkg-cache/packages/JUnixSocket/JUnixSocket-1.5.18/RHEL5_64/DEV.STD.PTHREAD/build/lib/junixsocket-rmi-1.3.jar:/opt/brazil-pkg-cache/packages/JavaCacheAPI/JavaCacheAPI-1.0.1087.3479/RHEL5_64/DEV.STD.PTHREAD/build/lib/JavaCacheAPI-tests.jar:/opt/brazil-pkg-cache/packages/JavaCacheAPI/JavaCacheAPI-1.0.1087.3479/RHEL5_64/DEV.STD.PTHREAD/build/lib/JavaCacheAPI.jar:/opt/brazil-pkg-cache/packages/Joda-time/Joda-time-2.1.1.3/RHEL5_64/DEV.STD.PTHREAD/build/lib/joda-time-2.1.jar:/opt/brazil-pkg-cache/packages/Mackerel/Mackerel-1.0.428.7/RHEL5_64/DEV.STD.PTHREAD/build/lib/Mackerel-1.0.jar:/opt/brazil-pkg-cache/packages/Barista/Barista-1.0.53.50/RHEL5_64/DEV.STD.PTHREAD/build/lib/Barista-1.0.jar:/opt/brazil-pkg-cache/packages/CGLib/CGLib-2.2.2_nodep.0.2873/RHEL5_64/DEV.STD.PTHREAD/build/lib/cglib-nodep-2.2.2.jar:/opt/brazil-pkg-cache/packages/G2S2FileBasedClient/G2S2FileBasedClient-1.0.24.768/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2FileBasedClient-1.0.jar:/opt/brazil-pkg-cache/packages/G2S2HttpBasedInternalClient/G2S2HttpBasedInternalClient-1.0.824.807/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2HttpBasedInternalClient-1.0.jar:/opt/brazil-pkg-cache/packages/G2S2ReadWriteFileBasedClient/G2S2ReadWriteFileBasedClient-1.0.204.883/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2ReadWriteFileBasedClient-1.0.jar:/opt/brazil-pkg-cache/packages/G2S2ClientImpl/G2S2ClientImpl-1.0.1176.2608/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2ClientImpl-1.0.jar:/opt/brazil-pkg-cache/packages/G2S2JavaFullClientInterface/G2S2JavaFullClientInterface-1.0.765.2164/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2JavaFullClientInterface-1.0.jar:/opt/brazil-pkg-cache/packages/G2S2JavaClientInterface/G2S2JavaClientInterface-1.0.902.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2JavaClientInterface-1.0.jar:/opt/brazil-pkg-cache/packages/G2S2Repository/G2S2Repository-1.0.590.1358/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2Repository-1.0.jar:/opt/brazil-pkg-cache/packages/IOPMetadataCacheLib/IOPMetadataCacheLib-1.0.100.58/RHEL5_64/DEV.STD.PTHREAD/build/lib/IOPMetadataCacheLib-1.0.jar:/opt/brazil-pkg-cache/packages/JMercurySearchLib/JMercurySearchLib-1.0.326.1146/RHEL5_64/DEV.STD.PTHREAD/build/lib/JMercurySearchLib-1.0.jar:/opt/brazil-pkg-cache/packages/IOPMetadataSearchLib/IOPMetadataSearchLib-1.0.818.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/IOPMetadataSearchLib-1.0.jar:/opt/brazil-pkg-cache/packages/G2S2Common/G2S2Common-1.0.920.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2Common-1.0.jar:/opt/brazil-pkg-cache/packages/CoralMetricsQuerylogReporter/CoralMetricsQuerylogReporter-1.0.3323.10879/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralMetricsQuerylogReporter-1.0.jar:/opt/brazil-pkg-cache/packages/CoralMetricsReporter/CoralMetricsReporter-1.0.4547.9311/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralMetricsReporter-1.0.jar:/opt/brazil-pkg-cache/packages/G2S2Schema/G2S2Schema-1.0.1606.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/G2S2Schema-1.0.jar:/opt/brazil-pkg-cache/packages/GoogleGuava/GoogleGuava-r16.5.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/GoogleGuava-r16.jar:/opt/brazil-pkg-cache/packages/AtInject/AtInject-1.0.736.26/RHEL5_64/DEV.STD.PTHREAD/build/lib/javax.inject.jar:/opt/brazil-pkg-cache/packages/JMercuryClient/JMercuryClient-1.0.646.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/JMercuryClient-1.0.jar:/opt/brazil-pkg-cache/packages/JacksonIon/JacksonIon-1.9.669.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/JacksonIon-1.9.jar:/opt/brazil-pkg-cache/packages/Jackson-mapper/Jackson-mapper-1.9.207.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/jackson-jaxrs-1.9.9.jar:/opt/brazil-pkg-cache/packages/Jackson-mapper/Jackson-mapper-1.9.207.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/jackson-mapper-asl-1.9.9.jar:/opt/brazil-pkg-cache/packages/Jackson/Jackson-1.9.1293.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/jackson-core-asl-1.9.9.jar:/opt/brazil-pkg-cache/packages/JakartaCommons-IO/JakartaCommons-IO-2.4.317.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/JakartaCommons-IO-2.4.jar:/opt/brazil-pkg-cache/packages/JavaCore/JavaCore-1.0.1908.40/RHEL5_64/DEV.STD.PTHREAD/build/lib/javacore.jar:/opt/brazil-pkg-cache/packages/JavaCore/JavaCore-1.0.1908.40/RHEL5_64/DEV.STD.PTHREAD/build/lib/javacoretests.jar:/opt/brazil-pkg-cache/packages/AmazonApolloEnvironmentInfoJava/AmazonApolloEnvironmentInfoJava-1.0.2368.8044/RHEL5_64/DEV.STD.PTHREAD/build/lib/AmazonApolloEnvironmentInfoJava-1.0.jar:/opt/brazil-pkg-cache/packages/AmazonIdJava/AmazonIdJava-1.0.3155.10974/RHEL5_64/DEV.STD.PTHREAD/build/lib/AmazonIdJava-1.0.jar:/opt/brazil-pkg-cache/packages/AmazonProfilerJava/AmazonProfilerJava-1.0.3399.16096/RHEL5_64/DEV.STD.PTHREAD/build/lib/AmazonProfilerJava-1.0.jar:/opt/brazil-pkg-cache/packages/AmazonTypesJava/AmazonTypesJava-1.0.2930.2874/RHEL5_64/DEV.STD.PTHREAD/build/lib/AmazonTypesJava-1.0.jar:/opt/brazil-pkg-cache/packages/CoralMetrics/CoralMetrics-1.0.3008.1937/RHEL5_64/DEV.STD.PTHREAD/build/lib/CoralMetrics-1.0.jar:/opt/brazil-pkg-cache/packages/Netty/Netty-3.9.0.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/netty-3.9.jar:/opt/brazil-pkg-cache/packages/OdinLocalRetriever/OdinLocalRetriever-1.0.1007.3361/RHEL5_64/DEV.STD.PTHREAD/build/lib/OdinLocalRetriever-1.0.jar:/opt/brazil-pkg-cache/packages/Json-org-java/Json-org-java-2.1.1217.34/RHEL5_64/DEV.STD.PTHREAD/build/lib/json.jar:/opt/brazil-pkg-cache/packages/ProtocolBuffersJava/ProtocolBuffersJava-2.4.135.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/protobuf-java-2.4.1.jar:/opt/brazil-pkg-cache/packages/ProtonJava/ProtonJava-1.0.801.2/RHEL5_64/DEV.STD.PTHREAD/build/lib/ProtonJava-1.0.jar:/opt/brazil-pkg-cache/packages/RendezvousJava/RendezvousJava-7.3.1303.37/RHEL5_64/DEV.STD.PTHREAD/build/lib/rendezvousj.jar:/opt/brazil-pkg-cache/packages/RestClientInterface/RestClientInterface-2.0.27.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/RestClientInterface-2.0.jar:/opt/brazil-pkg-cache/packages/SDLJava/SDLJava-1.0.1159.78/RHEL5_64/DEV.STD.PTHREAD/build/lib/SDLJava-1.0.jar:/opt/brazil-pkg-cache/packages/IonPathJava/IonPathJava-1.0.2120.575/RHEL5_64/DEV.STD.PTHREAD/build/lib/IonPathJava.jar:/opt/brazil-pkg-cache/packages/SableIonCatalogJava/SableIonCatalogJava-1.0.21.1307/RHEL5_64/DEV.STD.PTHREAD/build/lib/SableIonCatalogJava-1.0.jar:/opt/brazil-pkg-cache/packages/IonJava/IonJava-1.0.4539.4716/RHEL5_64/DEV.STD.PTHREAD/build/lib/IonJava.jar:/opt/brazil-pkg-cache/packages/JSableHttp/JSableHttp-1.0.306.3941/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSableHttp-1.0.jar:/opt/brazil-pkg-cache/packages/JMime/JMime-1.0.157.1226/RHEL5_64/DEV.STD.PTHREAD/build/lib/JMime-1.0.jar:/opt/brazil-pkg-cache/packages/JSable/JSable-1.0.662.1035/RHEL5_64/DEV.STD.PTHREAD/build/lib/JSable-1.0.jar:/opt/brazil-pkg-cache/packages/RestBatchClient/RestBatchClient-1.0.159.3677/RHEL5_64/DEV.STD.PTHREAD/build/lib/RestBatchClient-1.0.jar:/opt/brazil-pkg-cache/packages/RestClient/RestClient-1.0.280.8681/RHEL5_64/DEV.STD.PTHREAD/build/lib/RestClient-1.0.jar:/opt/brazil-pkg-cache/packages/JakartaCommons-httpclient/JakartaCommons-httpclient-3.0.2159.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/commons-httpclient-3.0.jar:/opt/brazil-pkg-cache/packages/SableJavaUtilities/SableJavaUtilities-1.0.2.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/SableJavaUtilities-1.0.jar:/opt/brazil-pkg-cache/packages/SableStumpy/SableStumpy-1.0.401.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/SableStumpy-1.0.jar:/opt/brazil-pkg-cache/packages/JakartaCommons-lang/JakartaCommons-lang-2.6.328.61/RHEL5_64/DEV.STD.PTHREAD/build/lib/commons-lang-2.6.jar:/opt/brazil-pkg-cache/packages/JakartaCommons-logging-adapters/JakartaCommons-logging-adapters-1.1.783.3047/RHEL5_64/DEV.STD.PTHREAD/build/lib/commons-logging-adapters-1.1.1.jar:/opt/brazil-pkg-cache/packages/JakartaCommons-logging-api/JakartaCommons-logging-api-1.1.1098.3247/RHEL5_64/DEV.STD.PTHREAD/build/lib/commons-logging-api-1.1.1.jar:/opt/brazil-pkg-cache/packages/SipHashJava/SipHashJava-1.0.29.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/SipHashJava-1.0.jar:/opt/brazil-pkg-cache/packages/Slf4j_log4j/Slf4j_log4j-1.7.1.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/slf4j-log4j12-1.7.4.jar:/opt/brazil-pkg-cache/packages/Slf4j/Slf4j-1.7.151.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/slf4j-api-1.7.4.jar:/opt/brazil-pkg-cache/packages/SnappyJava/SnappyJava-1.0.4.1.1.1/RHEL5_64/DEV.STD.PTHREAD/build/lib/snappy-java-1.0.4.1.jar:/opt/brazil-pkg-cache/packages/StumpyProtocol/StumpyProtocol-1.0.4155.976/RHEL5_64/DEV.STD.PTHREAD/build/lib/StumpyJava.jar:/opt/brazil-pkg-cache/packages/StumpyProtocol/StumpyProtocol-1.0.4155.976/RHEL5_64/DEV.STD.PTHREAD/build/lib/StumpyJavaTest.jar:/opt/brazil-pkg-cache/packages/S3FedConfigulator/S3FedConfigulator-1.0.896.1032/RHEL5_64/DEV.STD.PTHREAD/build/lib/libS3FedConfigulator.jar:/opt/brazil-pkg-cache/packages/S3FedConfigulator/S3FedConfigulator-1.0.896.1032/RHEL5_64/DEV.STD.PTHREAD/build/lib/libS3FedConfigulatorTests.jar:/opt/brazil-pkg-cache/packages/S3Configulator/S3Configulator-1.0.1043.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/S3Configulator-1.0.jar:/opt/brazil-pkg-cache/packages/S3Commons/S3Commons-1.0.5023.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/S3Commons-1.0.jar:/opt/brazil-pkg-cache/packages/AmazonFileAppenderJava/AmazonFileAppenderJava-1.0.4520.3857/RHEL5_64/DEV.STD.PTHREAD/build/lib/AmazonFileAppenderJava-1.0.jar:/opt/brazil-pkg-cache/packages/JakartaCommons-codec/JakartaCommons-codec-1.4.923.56/RHEL5_64/DEV.STD.PTHREAD/build/lib/commons-codec-1.4.jar:/opt/brazil-pkg-cache/packages/S3JUnit4Helper/S3JUnit4Helper-1.0.849.226/RHEL5_64/DEV.STD.PTHREAD/build/lib/S3JUnit4Helper-1.0.jar:/opt/brazil-pkg-cache/packages/J2ee_servlet/J2ee_servlet-3.0.1679.2427/RHEL5_64/DEV.STD.PTHREAD/build/lib/servlet-api-3.0.jar:/opt/brazil-pkg-cache/packages/JakartaCommons-cli/JakartaCommons-cli-1.2.717.7/RHEL5_64/DEV.STD.PTHREAD/build/lib/commons-cli-1.2.jar:/opt/brazil-pkg-cache/packages/JavaGetopt/JavaGetopt-1.0.1582.994/RHEL5_64/DEV.STD.PTHREAD/build/lib/java-getopt.jar:/opt/brazil-pkg-cache/packages/S3QueryLogBuilder/S3QueryLogBuilder-1.0.1495.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/S3QueryLogBuilder-1.0.jar:/opt/brazil-pkg-cache/packages/AmazonAppConfigJava/AmazonAppConfigJava-1.0.5127.7909/RHEL5_64/DEV.STD.PTHREAD/build/lib/AmazonAppConfigJava-1.0.jar:/opt/brazil-pkg-cache/packages/S3RateEstimator/S3RateEstimator-1.0.398.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/S3RateEstimator-1.0.jar:/opt/brazil-pkg-cache/packages/Sun-JSR-275/Sun-JSR-275-0.4.0.1149.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/jsr-275.jar:/opt/brazil-pkg-cache/packages/Sun-JSR-305/Sun-JSR-305-0.1.6.3/RHEL5_64/DEV.STD.PTHREAD/build/lib/jsr305.jar:/opt/brazil-pkg-cache/packages/j2ee/j2ee-1.0.1014.26/RHEL5_64/DEV.STD.PTHREAD/build/lib/j2ee.jar:/opt/brazil-pkg-cache/packages/junit/junit-4.7.762.7/RHEL5_64/DEV.STD.PTHREAD/build/lib/junit.jar:/opt/brazil-pkg-cache/packages/Hamcrest/Hamcrest-1.1.775.4/RHEL5_64/DEV.STD.PTHREAD/build/lib/hamcrest-all-1.1.jar:/opt/brazil-pkg-cache/packages/log4j/log4j-1.2.1456.0/RHEL5_64/DEV.STD.PTHREAD/build/lib/log4j-1.2.17.jar amazon.sable.container.main.Main --root=. --domain=earth --realm=test --override=query-service-localhost-8080.cfg'
