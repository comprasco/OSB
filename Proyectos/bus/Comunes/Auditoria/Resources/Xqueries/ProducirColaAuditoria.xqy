xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.supernotariado.gov.co/schemas/bachue/auditoria/v1";
(:: import schema at "../Schemas/Auditoria.xsd" ::)

declare variable $UUID as xs:string external;
declare variable $tipoMensaje as xs:string external;
declare variable $fechaHora as xs:string external;
declare variable $tamano as xs:string external;
declare variable $terminal as xs:string external;
declare variable $dominio as xs:string external;
declare variable $usuario as xs:string external;
declare variable $servicio as xs:string external;
declare variable $operacion as xs:string external;
declare variable $mensaje as element() external;

declare function local:func($UUID as xs:string,
                            $tipoMensaje as xs:string,
                            $fechaHora as xs:string,
                            $tamano as xs:string,
                            $terminal as xs:string,
                            $dominio as xs:string,
                            $usuario as xs:string,
                            $servicio as xs:string,
                            $operacion as xs:string,
                            $mensaje as element()) as element() (:: schema-element(ns1:mensajeAuditoria) ::) {
    <ns1:mensajeAuditoria>
        <UUID>{fn:data($UUID)}</UUID>
        <tipoMensaje>{fn:data($tipoMensaje)}</tipoMensaje>
        <fechaHora>{fn:data($fechaHora)}</fechaHora>
        <tamano>{fn:data($tamano)}</tamano>
        <terminal>{fn:data($terminal)}</terminal>
        <dominio>{fn:data($dominio)}</dominio>
        <usuario>{fn:data($usuario)}</usuario>
        <servicio>{fn:data($servicio)}</servicio>
        <operacion>{fn:data($operacion)}</operacion>
        <mensaje>
          <body>{$mensaje}</body>
        </mensaje>
    </ns1:mensajeAuditoria>
};

local:func($UUID,$tipoMensaje,$fechaHora,$tamano,$terminal,$dominio,$usuario,$servicio,$operacion,$mensaje)