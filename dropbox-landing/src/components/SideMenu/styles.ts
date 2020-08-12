import styled from "styled-components";

export const Container = styled.div`
  z-index: 10;

  position: fixed;
  top: 0;
  right: 0;

  width: 100%;
  height: 100%;
  transform: translateX(100%);

  /* cubic-bezier: efeito de animação */
  transition: transform 0.5s cubic-bezier(0.5, 0, 0, 1);

  background: var(--color-tertiary);

  &.open {
    transform: translateX(0);
  }

  @media (min-width: 1024px) {
    width: calc(100% / 3);

    box-shadow: -7px 0 5px -6px rgba(0, 0, 0, 0.075);

    &.scrollOpen {
      transform: translateX(0);
    }

    &.scrollOpen .action--close {
      display: none;
    }
  }

  @media (min-width: 1440px) {
    width: calc(480px + ((100vw - 1440px) / 2));
  }
`;
