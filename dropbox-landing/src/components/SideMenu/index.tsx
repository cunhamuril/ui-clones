import React, { useEffect, useState } from "react";

import { Container } from "./styles";

const scrollThreshold = 300;

// Declaração da função no escopo global
declare global {
  interface Window {
    toggleActiveMenu: (() => void) | undefined;
  }
}

const SideMenu: React.FC = ({ children }) => {
  const [scrollY, setScrollY] = useState(0);
  const [isActive, setIsActive] = useState(false);

  useEffect(() => {
    function onScroll() {
      setScrollY(window.scrollY);
      setIsActive(false);
    }

    window.addEventListener("scroll", onScroll);

    /**
     * return no final é como se fosse componentWillUnmount;
     */
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  // Se o isActive estiver habilitado vai setar a class open
  // Se o scrollY <= 300 vai setar a class scrollOpen
  // A diferença entre open e scrollOpen é que o "open" vai aparecer o X de fechar
  const classes = [
    isActive ? "open" : "",
    scrollY <= scrollThreshold ? "scrollOpen" : "",
  ];

  // Vai juntar as classes em uma só string
  const className = classes.join(" ").trim();

  function toggleActiveMenu() {
    setIsActive((prev) => !prev);
  }

  // Vai passar a função para o escopo global
  window.toggleActiveMenu = toggleActiveMenu;

  return <Container className={className}>{children}</Container>;
};

export default SideMenu;
