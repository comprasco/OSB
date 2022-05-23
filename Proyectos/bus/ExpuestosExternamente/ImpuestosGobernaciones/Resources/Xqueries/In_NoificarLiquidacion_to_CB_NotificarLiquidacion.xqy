xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/impuestosgobernaciones/notificarliquidacion/v1";
(:: import schema at "../Schemas/Legacy/CB_IG_NotificarLiquidacion.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/impuestosgobernaciones/notificarliquidacion/v1";
(:: import schema at "../Schemas/EE_IG_NotificarLiquidacion.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaNotificarLiquidacion) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaNotificarLiquidacion) ::)) as element() (:: schema-element(ns2:entradaNotificarLiquidacion) ::) {
    <ns2:entradaNotificarLiquidacion>
        <ns2:idTramite>{fn:data($payloadRequest/idTramite)}</ns2:idTramite>
        <ns2:estadoPago>{fn:data($payloadRequest/estadoPago)}</ns2:estadoPago>
        <ns2:fechaVencimiento>{fn:data($payloadRequest/fechaVencimiento)}</ns2:fechaVencimiento>
        <ns2:referenciaLiquidacion>{fn:data($payloadRequest/referenciaLiquidacion)}</ns2:referenciaLiquidacion>
        <ns2:identificadorTransaccion>{fn:data($payloadRequest/identificadorTransaccion)}</ns2:identificadorTransaccion>
        <ns2:matriculas>
            {
                for $matricula in $payloadRequest/matriculas/matricula
                return 
                <ns2:matricula>
                    <ns2:numeroMatricula>{fn:data($matricula/numeroMatricula)}</ns2:numeroMatricula>
                    <ns2:actos>
                        {
                            for $acto in $matricula/actos/acto
                            return 
                            <ns2:acto>
                                <ns2:codigoActo>{fn:data($acto/codigoActo)}</ns2:codigoActo>
                                <ns2:valorActo>{fn:data($acto/valorActo)}</ns2:valorActo>
                                <ns2:valorCuantiaActo>{fn:data($acto/valorCuantiaActo)}</ns2:valorCuantiaActo></ns2:acto>
                        }
                    </ns2:actos></ns2:matricula>
            }
        </ns2:matriculas>
        <ns2:reciboLiquidacion>{fn:data($payloadRequest/reciboLiquidacion)}</ns2:reciboLiquidacion>
    </ns2:entradaNotificarLiquidacion>
};

local:func($payloadRequest)