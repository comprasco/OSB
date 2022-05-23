xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://gevir.cundinamarca.gov.co";
(:: import schema at "WSDLs/BS_WSNotificacionRegistro.wsdl" ::)


declare function local:func() as element() (:: element(*, ns1:matricula) ::) {
    <ns1:matricula/>
};

local:func()
