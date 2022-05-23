xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../Schemas/EE_Actualizar.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/EE/NAA/v1";
(:: import schema at "../Schemas/EE_Actualizar3.xsd" ::)

declare variable $circulosResponse as element() (:: schema-element(circulos) ::) external;
declare variable $matriculaInmobiliariaResponse as element() (:: schema-element(matriculaInmobiliaria) ::) external;

declare function local:func($circulosResponse as element() (:: schema-element(circulos) ::), 
                            $matriculaInmobiliariaResponse as element() (:: schema-element(matriculaInmobiliaria) ::)) 
                            as element() (:: schema-element(ns1:Response) ::) {
    <ns1:Response>
        {
            for $response at $pos in $circulosResponse/response
            return 
                <ns1:Actualizar>
                    <ns1:circuloM>{fn:data($circulosResponse/response[$pos]/circuloM)}</ns1:circuloM>
                    <ns1:numeroMatriculaInmobiliaria>{fn:data($matriculaInmobiliariaResponse/response1[$pos]/numeroMatriculaInmobiliaria)}</ns1:numeroMatriculaInmobiliaria></ns1:Actualizar>
        }
       
    </ns1:Response>
};

local:func($circulosResponse, $matriculaInmobiliariaResponse)