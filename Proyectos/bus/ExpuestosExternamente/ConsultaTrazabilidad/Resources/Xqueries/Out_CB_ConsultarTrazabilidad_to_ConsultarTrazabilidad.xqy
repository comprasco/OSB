xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultatrazabilidad/consultartrazabilidad/v1";
(:: import schema at "../Schemas/Legacy/CB_CT_ConsultarTrazabilidad.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/consultatrazabilidad/consultartrazabilidad/v1";
(:: import schema at "../Schemas/EE_CT_ConsultarTrazabilidad.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarTrazabilidad) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarTrazabilidad) ::)) as element() (:: schema-element(ns2:salidaConsultarTrazabilidad) ::) {
    <ns2:salidaConsultarTrazabilidad>
        <ns2:nir>{fn:data($payloadResponse/ns1:nir)}</ns2:nir>
        <ns2:faseActualNIR>{fn:data($payloadResponse/ns1:faseActualNIR)}</ns2:faseActualNIR>
        <ns2:nirVinculado>{fn:data($payloadResponse/ns1:nirVinculado)}</ns2:nirVinculado>
        <ns2:tramiteVinculado>{fn:data($payloadResponse/ns1:tramiteVinculado)}</ns2:tramiteVinculado>
        <ns2:elementosnir>
            {
                for $elementonir in $payloadResponse/ns1:elementosnir/ns1:elementonir
                return 
                <ns2:elementonir>
                    <ns2:turno>{fn:data($elementonir/ns1:turno)}</ns2:turno>
                    <ns2:orip>{fn:data($elementonir/ns1:orip)}</ns2:orip>
                    <ns2:decisionCalificacion>{fn:data($elementonir/ns1:decisionCalificacion)}</ns2:decisionCalificacion>
                    <ns2:faseActualTurno>{fn:data($elementonir/ns1:faseActualTurno)}</ns2:faseActualTurno>
                    <ns2:procesoTurno>{fn:data($elementonir/ns1:procesoTurno)}</ns2:procesoTurno>
                    <ns2:documentos>
                        {
                            for $documento in $elementonir/ns1:documentos/ns1:documento
                            return 
                            <ns2:documento>
                                <ns2:tipo>{fn:data($documento/ns1:tipo)}</ns2:tipo>
                                <ns2:numeroDocumento>{fn:data($documento/ns1:numeroDocumento)}</ns2:numeroDocumento>
                                <ns2:fechaDocumento>{fn:data($documento/ns1:fechaDocumento)}</ns2:fechaDocumento>
                                <ns2:oficinaOrigen>{fn:data($documento/ns1:oficinaOrigen)}</ns2:oficinaOrigen>
                                <ns2:tipoOficina>{fn:data($documento/ns1:tipoOficina)}</ns2:tipoOficina>
                                <ns2:departamento>{fn:data($documento/ns1:departamento)}</ns2:departamento>
                                <ns2:municipio>{fn:data($documento/ns1:municipio)}</ns2:municipio>
                                <ns2:tipoEntidad>{fn:data($documento/ns1:tipoEntidad)}</ns2:tipoEntidad></ns2:documento>
                        }
                    </ns2:documentos>
                    <ns2:matriculas>
                        {
                            for $matricula in $elementonir/ns1:matriculas/ns1:matricula
                            return 
                            <ns2:matricula>
                                <ns2:orip>{fn:data($matricula/ns1:orip)}</ns2:orip>
                                <ns2:numeroMatricula>{fn:data($matricula/ns1:numeroMatricula)}</ns2:numeroMatricula>
                                <ns2:estado>{fn:data($matricula/ns1:estado)}</ns2:estado>
                                <ns2:alertaVigente>{fn:data($matricula/ns1:alertaVigente)}</ns2:alertaVigente></ns2:matricula>
                        }
                    </ns2:matriculas>
                    <ns2:trazabilidades>
                        {
                            for $trazabilidad in $elementonir/ns1:trazabilidades/ns1:trazabilidad
                            return 
                            <ns2:trazabilidad>
                                <ns2:etapa>{fn:data($trazabilidad/ns1:etapa)}</ns2:etapa>
                                <ns2:nombreEtapa>{fn:data($trazabilidad/ns1:nombreEtapa)}</ns2:nombreEtapa>
                                <ns2:estadoActividad>{fn:data($trazabilidad/ns1:estadoActividad)}</ns2:estadoActividad>
                                <ns2:usuario>{fn:data($trazabilidad/ns1:usuario)}</ns2:usuario>
                                <ns2:fechaAsignacion>{fn:data($trazabilidad/ns1:fechaAsignacion)}</ns2:fechaAsignacion>
                                <ns2:fechaReparto>{fn:data($trazabilidad/ns1:fechaReparto)}</ns2:fechaReparto>
                                <ns2:fechaInicioEtapa>{fn:data($trazabilidad/ns1:fechaInicioEtapa)}</ns2:fechaInicioEtapa>
                                <ns2:fechaFinalEtapa>{fn:data($trazabilidad/ns1:fechaFinalEtapa)}</ns2:fechaFinalEtapa></ns2:trazabilidad>
                        }
                    </ns2:trazabilidades></ns2:elementonir>
            }
        </ns2:elementosnir>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
        
    </ns2:salidaConsultarTrazabilidad>
};

local:func($payloadResponse)