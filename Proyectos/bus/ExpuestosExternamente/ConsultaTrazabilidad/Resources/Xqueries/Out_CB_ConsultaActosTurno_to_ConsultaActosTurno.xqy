xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultatrazabilidad/consultaActosTurno/v1";
(:: import schema at "../Schemas/Legacy/CB_CT_ConsultaActosTurno.xsd" ::)
declare namespace v1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultatrazabilidad/consultaActosTurno/v1";
(:: import schema at "../Schemas/EE_CT_ConsultaActosTurno.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultaActosTurno) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultaActosTurno) ::)) as element() (:: schema-element(v1:salidaConsultaActosTurno) ::) {
    <v1:salidaConsultaActosTurno>
        <v1:nir>{fn:data($payloadResponse/ns1:nir)}</v1:nir>
        <v1:actos>
            {
                for $acto in $payloadResponse/ns1:actos/ns1:acto
                return 
                <v1:acto>
                    <v1:codigoActo>{fn:data($acto/ns1:codigoActo)}</v1:codigoActo>
                    {
                        if ($acto/ns1:codigoTipoActo)
                        then <v1:codigoTipoActo>{fn:data($acto/ns1:codigoTipoActo)}</v1:codigoTipoActo>
                        else ()
                    }
                    <v1:nombreTipoActo>{fn:data($acto/ns1:nombreTipoActo)}</v1:nombreTipoActo>
                    <v1:tieneCuantia>{fn:data($acto/ns1:tieneCuantia)}</v1:tieneCuantia>
                    <v1:tarifaExenta>{fn:data($acto/ns1:tarifaExenta)}</v1:tarifaExenta>
                    {
                        if ($acto/ns1:valorCuantia)
                        then <v1:valorCuantia>{fn:data($acto/ns1:valorCuantia)}</v1:valorCuantia>
                        else ()
                    }
                    {
                        if ($acto/ns1:valorAvaluo)
                        then <v1:valorAvaluo>{fn:data($acto/ns1:valorAvaluo)}</v1:valorAvaluo>
                        else ()
                    }
                    {
                        if ($acto/ns1:cantidadActos)
                        then <v1:cantidadActos>{fn:data($acto/ns1:cantidadActos)}</v1:cantidadActos>
                        else ()
                    }
                    {
                        if ($acto/ns1:valorDerechos)
                        then <v1:valorDerechos>{fn:data($acto/ns1:valorDerechos)}</v1:valorDerechos>
                        else ()
                    }
                    {
                        if ($acto/ns1:valorConservacionDocumental)
                        then <v1:valorConservacionDocumental>{fn:data($acto/ns1:valorConservacionDocumental)}</v1:valorConservacionDocumental>
                        else ()
                    }
                    {
                        if ($acto/ns1:valorTotal)
                        then <v1:valorTotal>{fn:data($acto/ns1:valorTotal)}</v1:valorTotal>
                        else ()
                    }
                    <v1:certificados>
                        {
                            for $turno in $acto/ns1:certificados/ns1:turno
                            return 
                            <v1:turno>{fn:data($acto/ns1:certificados/ns1:turno)}</v1:turno>
                        }
                    </v1:certificados>
                    </v1:acto>
            }
        </v1:actos>
        
        <v1:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</v1:codigoMensaje>
        <v1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</v1:descripcionMensaje>
    </v1:salidaConsultaActosTurno>
};

local:func($payloadResponse)
